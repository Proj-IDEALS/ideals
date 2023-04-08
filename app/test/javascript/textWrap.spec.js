import wrapText from "../../app/javascript/packs/helper";
const { JSDOM } = require('jsdom');
const { createCanvas } = require('canvas');


const dom = new JSDOM('<!DOCTYPE html><html lang=""><body></body></html>');
const document = dom.window.document;
global.document = document;
global.createCanvas = createCanvas;

describe('wrapText', () => {
    test('should wrap text correctly within maxWidth', () => {
        const inputText = 'This is a sample text to test the wrapping function';
        const maxWidth = 20;
        const expectedResult = 'This\nis a\nsample\n' +
            'text\nto\ntest\nthe\n' +
            'wrapping\nfunction';
        expect(wrapText(inputText, maxWidth)).toBe(expectedResult);
    });

    test('should capitalize the first letter of the text', () => {
        const inputText = 'capitalize me';
        const maxWidth = 20;
        const expectedResult = 'Capitalize\nme';
        expect(wrapText(inputText, maxWidth)).toBe(expectedResult);
    });

    test('should handle empty strings', () => {
        const inputText = '';
        const maxWidth = 20;
        const expectedResult = '';
        expect(wrapText(inputText, maxWidth)).toBe(expectedResult);
    });

    test('should handle one-word texts', () => {
        const inputText = 'oneword';
        const maxWidth = 20;
        const expectedResult = 'Oneword';
        expect(wrapText(inputText, maxWidth)).toBe(expectedResult);
    });

    test('should handle maxWidth less than the longest word', () => {
        const inputText = 'This is a test with a longword';
        const maxWidth = 5;
        const expectedResult = 'This\nis\na\ntest\nwith\na\nlongword';
        expect(wrapText(inputText, maxWidth)).toBe(expectedResult);
    });
});