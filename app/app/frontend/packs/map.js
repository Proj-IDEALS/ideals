import G6 from "@antv/g6";


function wrapText(text, maxWidth) {
    if (text && text.length > 0)
        text = text.charAt(0).toUpperCase() + text.slice(1);

    const words = text.split(' ');
    let currentLine = words[0];
    const lines = [];

    for (let i = 1; i < words.length; i++) {
        const word = words[i];
        const width = document.createElement('canvas').getContext('2d')
            .measureText(currentLine + ' ' + word).width;

        if (width < maxWidth) {
            currentLine += ' ' + word;
        } else {
            lines.push(currentLine);
            currentLine = word;
        }
    }
    lines.push(currentLine);
    return lines.join('\n');
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
        type: 'modelRect',
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
        preRect: {
            show: true,
            width: 4,
            fill: '#40a9ff',
            radius: 2,
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
        },
        logoIcon: {
            show: false,
        },
        stateIcon: {
            show: false,
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

        graphData.nodes.forEach(function (node) {
            node.label = wrapText(node.label, 80);
        });
        graph.data(graphData);
        graph.render();
    });


graph.on('node:mouseenter', (evt) => {
    const {item} = evt;
    graph.setItemState(item, 'hover', true);
});

graph.on('node:mouseleave', (evt) => {
    const {item} = evt;
    graph.setItemState(item, 'hover', false);
});