import 'core-js/stable'
import 'regenerator-runtime/runtime'
import G6 from "@antv/g6";

const data = {
    nodes: [
        {
            id: "1",
            label: "listening",
        },
        {
            id: "2",
            label: "discussion of concept map, teasing out connections",
        },
        {
            id: "3",
            label: "knowledge activation activities",
        },
        {
            id: "4",
            label: "learning requires cognitive dissonance",
        },
        {
            id: "5",
            label: "Cognitive Constructivist Theory",
        },
        {
            id: "6",
            label: "just-in-time mini-lectures",
        }
    ],
    edges: [
        {
            source: "1",
            target: "2",
        },
        {
            source: "3",
            target: "4",
        },
        {
            source: "1",
            target: "3",
        },
        {
            source: "4",
            target: "5",
        },
        {
            source: "1",
            target: "6",
        },
        {
            source: "5",
            target: "6",
        },
        {
            source: "3",
            target: "5",
        },
        {
            source: "4",
            target: "6",
        }
    ]
}

const calcStrLen = str => {
    let len = 0;
    for (let i = 0; i < str.length; i++) {
        if (str.charCodeAt(i) > 0 && str.charCodeAt(i) < 128) {
            len++;
        } else {
            len += 2;
        }
    }
    return len;
};

const fittingString = (str, maxWidth, fontSize) => {
    const fontWidth = fontSize * 1.3;
    maxWidth = maxWidth * 2;
    const width = calcStrLen(str) * fontWidth;
    const ellipsis = '…';
    if (width > maxWidth) {
        const actualLen = Math.floor((maxWidth - 10) / fontWidth);
        const result = str.substring(0, actualLen) + ellipsis;
        return result;
    }
    return str;
};

data.nodes.forEach(function (node) {
    node.label = fittingString(node.label, 150, 12);
});



const width = document.getElementById('concept-map').scrollWidth;
const height = document.getElementById('concept-map').scrollHeight || 700;

const toolbar = new G6.ToolBar();
const grid = new G6.Grid();
const minimap = new G6.Minimap();

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
        nodeSize: [170, 80],
        linkDistance: 200
    },
    defaultNode: {
        type: 'modelRect',
        style: {
            size: [170, 80],
            lineWidth: 1,
            fillOpacity: 1,
        },
        // label configurations
        labelCfg: {
            style: {
                fill: '#595959',
                fontSize: 14,
            },
            offset: 30,
        },
        // left rect
        preRect: {
            show: true,
            width: 4,
            fill: '#40a9ff',
            radius: 2,
        },
        // configurations for the four linkpoints
        linkPoints: {
            top: false,
            right: false,
            bottom: false,
            left: false,
            // the size of the linkpoints' circle
            size: 10,
            lineWidth: 1,
            fill: '#72CC4A',
            stroke: '#72CC4A',
        },
        // configurations for the icon
        logoIcon: {
            // whether to show the icon
            show: true,
            x: 0,
            y: 0,
            // the image url for the icon, string type
            img:
                'https://gw.alipayobjects.com/zos/basement_prod/4f81893c-1806-4de4-aff3-9a6b266bc8a2.svg',
            width: 16,
            height: 16,
            // adjust the offset along x-axis for the icon
            offset: 0,
        },
        // configurations for state icon
        stateIcon: {
            // whether to show the icon
            show: true,
            x: 0,
            y: 0,
            // the image url for the icon, string type
            img:
                'https://gw.alipayobjects.com/zos/basement_prod/300a2523-67e0-4cbf-9d4a-67c077b40395.svg',
            width: 16,
            height: 16,
            // adjust hte offset along x-axis for the icon
            offset: -5,
        },
    },
    modes: {
        default: ['zoom-canvas', 'drag-canvas', 'drag-node'],
    },
    nodeStateStyles: {
        hover: {
            lineWidth: 2,
            stroke: '#1890ff',
            fill: '#e6f7ff',
        },
    },
});

graph.data(data);
graph.render();

graph.on('node:mouseenter', (evt) => {
    const {item} = evt;
    graph.setItemState(item, 'hover', true);
});

graph.on('node:mouseleave', (evt) => {
    const {item} = evt;
    graph.setItemState(item, 'hover', false);
});
