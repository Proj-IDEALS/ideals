$(document).ready(function () {
    fetch("api/v1/map")
        .then((response) => response.json())
        .then(data => {
            let concepts = [];
            ['assumptions', 'theories', 'practices'].forEach((label, i) => {
                data[label].forEach((node) => {
                    concepts.push({id: node.id, label: node.name, value: node.name, type: label})
                });
            });
            const iframe = document.getElementById('iframe');
            $('#autocomplete').autocomplete({
                source: concepts,
                select: function (event, ui) {
                    fadeOutUnconnected(ui.item.id);
                    iframe.src = `/${ui.item.type}/${ui.item.id}`;
                    console.log('Selected Item:', ui.item.id);
                }
            })
        })
})