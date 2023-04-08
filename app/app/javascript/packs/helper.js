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

export default wrapText;