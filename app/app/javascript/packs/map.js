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
}

const width = document.getElementById('concept-map').scrollWidth;
const height = document.getElementById('concept-map').scrollHeight || 700;

const toolbar = new G6.ToolBar();

const menu = new G6.Menu({
    getContent(e) {
        const outDiv = document.createElement('div');
        outDiv.style.width = '180px';
        outDiv.innerHTML = `<ul>
        <li>menu01</li>
        <li>menu01</li>
        <li>menu01</li>
        <li>menu01</li>
        <li>menu01</li>
      </ul>`
        return outDiv
    },
    handleMenuClick(target, item) {
        console.log(target, item)
    },
});

const graph = new G6.Graph({
    container: 'concept-map',
    plugins: [toolbar],
    width,
    height,
    fitViewPadding: true,
    layout: {
        type: 'force',
        preventOverlap: true,
        linkDistance: 500
    },
    defaultNode: {
        type: 'rect',
        size: [160, 190],
        style: {
            stroke: '#658FF9',
        },
        labelCfg: {
            position: 'center',
            offsetY: 0,
            style: {
                fill: '#595959',
                fontSize: 15,
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
            endArrow: true
        },
        curveStrength: 0.5,
        curveOffset: 20
    },
    modes: {
        default: ['zoom-canvas', 'drag-canvas', 'drag-node'],
    }
});

function initGraph(fade=false, label) {
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
                            lineWidth: 2,
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

            if(fade) {
                fadeOutUnconnected(label)
            }
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

initGraph(false, 0);

window.fadeOutUnconnected = fadeOutUnconnected;
window.resetGraph = resetGraph;
window.initGraph = initGraph;
