import G6 from "@antv/g6";
import wrapText from "./helper";


function resetGraph() {
    graph.getNodes().forEach(node => {
        node.update({
            style: {
                opacity: 1,
            },
            labelCfg: {
                style: {
                    opacity: 1,
                },
            },
        });
    });

    graph.getEdges().forEach(edge => {
        edge.update({
            style: {
                opacity: 1,
            },
        });
    });

    graph.refreshPositions();
    graph.fitView();
}

const width = document.getElementById('concept-map').scrollWidth;
const height = document.getElementById('concept-map').scrollHeight || 700;

const toolbar = new G6.ToolBar();


const menu = new G6.Menu({

    getContent(e) {
        const id = e.item._cfg.id;
        const outDiv = document.createElement('div');
        outDiv.innerHTML = `
        <div class="btn-group" role="group" aria-label="Icon group">
            <button type="button" class="btn btn-outline-secondary expand">
                <i class="bi bi-arrows-fullscreen expand"></i>
            </button>
            <button type="button" class="btn btn-outline-secondary contract">
                <i class="bi bi-arrows-angle-contract contract"></i>
            </button>
            <button type="button" class="btn btn-outline-secondary delete">
                <i class="bi bi-x-lg delete"></i>
            </button>
            <button type="button" class="btn btn-outline-secondary focus">
                <i class="bi bi-arrow-counterclockwise focus"></i>
            </button>
        </div>
        `
        return outDiv
    },
    handleMenuClick(target, item) {
        const text = String(target.className);
        if (text.includes('expand')) {
            if (item._cfg.type === 'node') {
                expandNode(item._cfg.id);
            }
        } else if (text.includes('contract')) {
            if (item._cfg.type === 'node') {
                contractNode(item._cfg.id);
            }
        } else if (text.includes('delete')) {
            if (item._cfg.type === 'node') {
                fadeOutNodeAndConnectedEdges(item._cfg.id);
            }
        } else if (text.includes('focus')) {
            if (item._cfg.type === 'node') {
                fadeOutNodeAndConnectedEdges(item._cfg.id, 1);
            }
        }
    },
});

const graph = new G6.Graph({
    container: 'concept-map',
    plugins: [toolbar, menu],
    width,
    height,
    fitViewPadding: true,
    fitCenter: true,
    layout: {
        type: 'force',
        preventOverlap: true,
        linkDistance: 1000
    },
    defaultNode: {
        type: 'rect',
        size: [160, 190],
        style: {
            stroke: '#658FF9',
            radius: 10,
        },
        labelCfg: {
            position: 'center',
            offsetY: 0,
            style: {
                fill: '#595959',
                fontSize: 20,
            }
        },
        linkPoints: {
            top: false,
            right: false,
            bottom: false,
            left: false,
            size: 10,
            lineWidth: 1,
            fill: '#72CC4A',
            stroke: '#72CC4A',
        }
    },
    defaultEdge: {
        type: 'quadratic',
        shape: 'polyline',
        style: {
            stroke: '#333',
            endArrow: false
        },
        curveStrength: 0.5,
        curveOffset: 50
    },
    modes: {
        default: ['zoom-canvas', 'drag-canvas', 'drag-node'],
    }
});

function initGraph(fade = false, label) {
    fetch("api/v1/map")
        .then((response) => response.json())
        .then(data => {
            let graphData = {nodes: [], edges: []};
            const colors = {assumptions: 'red', theories: 'blue', practices: 'green'};
            ['assumptions', 'theories', 'practices'].forEach((label, i) => {
                data[label].forEach((node) => {
                    graphData.nodes.push({
                        id: (label + node.id.toString()).toString(),
                        label: node.name,
                        style: {
                            lineWidth: 4,
                            stroke: colors[label],
                        },
                        preRect: {
                            fill: colors[label],
                        }
                    })
                });
            });

            data['assumptions_practices'].forEach((edge) => {
                graphData.edges.push({
                    source: ('assumptions' + edge['assumption_id'].toString()).toString(),
                    target: ('practices' + edge['practice_id'].toString()).toString()
                })
            });

            data['assumptions_theories'].forEach((edge) => {
                graphData.edges.push({
                    source: ('assumptions' + edge['assumption_id'].toString()).toString(),
                    target: ('theories' + edge['theory_id'].toString()).toString()
                })
            });

            graphData.nodes.forEach(function (node) {
                node.label = wrapText(node.label, 80);
            });
            graph.data(graphData);
            graph.render();

            if (fade) {
                fadeOutUnconnected(label)
            }
            setTimeout(() => {
                graph.fitView();
            }, 200);
        });
}

graph.on('node:mouseenter', (evt) => {
    const {item} = evt;
    graph.setItemState(item, 'hover', true);
});

graph.on('node:mouseleave', (evt) => {
    const {item} = evt;
    graph.setItemState(item, 'hover', false);
});

function fadeOutUnconnected(nodeId) {
    resetGraph();
    // Get connected nodes and edges
    const connectedNodeIds = new Set([nodeId]);
    const connectedEdgeIds = new Set();

    graph.getEdges().forEach(edge => {
        if (edge.getSource().get('id') === nodeId || edge.getTarget().get('id') === nodeId) {
            connectedNodeIds.add(edge.getSource().get('id'));
            connectedNodeIds.add(edge.getTarget().get('id'));
            connectedEdgeIds.add(edge.get('id'));
        }
    });
    // Fade out unconnected nodes and edges
    graph.getNodes().forEach(node => {
        if (!connectedNodeIds.has(node.get('id'))) {
            node.update({
                style: {
                    opacity: 0,
                },
                labelCfg: {
                    style: {
                        opacity: 0,
                    },
                }
            });
        }
    });

    graph.getEdges().forEach(edge => {
        if (!connectedEdgeIds.has(edge.get('id'))) {
            edge.update({
                style: {
                    opacity: 0,
                },
            });
        }
    });

    graph.refreshPositions();
}

function expandNode(nodeId, opacity = 1) {
    const connectedNodeIds = new Set([nodeId]);
    const connectedEdgeIds = new Set();

    graph.getEdges().forEach(edge => {
        if (edge.getSource().get('id') === nodeId || edge.getTarget().get('id') === nodeId) {
            connectedNodeIds.add(edge.getSource().get('id'));
            connectedNodeIds.add(edge.getTarget().get('id'));
            connectedEdgeIds.add(edge.get('id'));
        }
    });

    // Increase the opacity of connected nodes and edges
    graph.getNodes().forEach(node => {
        if (connectedNodeIds.has(node.get('id'))) {
            const currentOpacity = node.getModel().style.opacity;
            const updatedOpacity = Math.min(opacity, currentOpacity + opacity);
            node.update({
                style: {
                    opacity: updatedOpacity,
                },
                labelCfg: {
                    style: {
                        opacity: updatedOpacity,
                    },
                }
            });
        }
    });

    graph.getEdges().forEach(edge => {
        if (connectedEdgeIds.has(edge.get('id'))) {
            const currentOpacity = edge.getModel().style.opacity;
            const updatedOpacity = Math.min(opacity, currentOpacity + opacity);
            edge.update({
                style: {
                    opacity: updatedOpacity,
                },
            });
        }
    });

    graph.refreshPositions();
}

function contractNode(nodeId, opacity = 0) {
    // Get directly connected nodes and edges
    const connectedNodeIds = new Set();
    const connectedEdgeIds = new Set();

    graph.getEdges().forEach(edge => {
        if (edge.getSource().get('id') === nodeId || edge.getTarget().get('id') === nodeId) {
            connectedNodeIds.add(edge.getSource().get('id'));
            connectedNodeIds.add(edge.getTarget().get('id'));
            connectedEdgeIds.add(edge.get('id'));
        }
    });

    // Remove the given nodeId from connectedNodeIds
    connectedNodeIds.delete(nodeId);

    // Fade out connected edges
    graph.getEdges().forEach(edge => {
        if (connectedEdgeIds.has(edge.get('id'))) {
            edge.update({
                style: {
                    opacity: opacity,
                },
            });
        }
    });

    // Fade out connected nodes only if they are not connected to other nodes
    graph.getNodes().forEach(node => {
        if (connectedNodeIds.has(node.get('id'))) {
            const connections = graph.getEdges().filter(edge => {
                return (
                    edge.getSource().get('id') === node.get('id') || edge.getTarget().get('id') === node.get('id')
                );
            });

            if (connections.length === 1) {
                node.update({
                    style: {
                        opacity: opacity,
                    },
                    labelCfg: {
                        style: {
                            opacity: opacity,
                        },
                    },
                });
            }
        }
    });

    graph.refreshPositions();
}

function fadeOutNodeAndConnectedEdges(nodeId, opacity = 0.2) {
    const connectedEdges = graph.getEdges().filter(edge => {
        return edge.getSource().get('id') === nodeId || edge.getTarget().get('id') === nodeId;
    });
    const node = graph.findById(nodeId);
    node.update({
        style: {
            opacity: opacity,
        },
        labelCfg: {
            style: {
                opacity: opacity,
            },
        },
    });
    connectedEdges.forEach(edge => {
        edge.update({
            style: {
                opacity: opacity,
            },
        });
    });
}

initGraph(false, 0);

window.fadeOutUnconnected = fadeOutUnconnected;
window.resetGraph = resetGraph;
window.initGraph = initGraph;
