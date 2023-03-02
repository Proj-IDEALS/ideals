/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/application.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/application.js":
/*!*********************************************!*\
  !*** ./app/javascript/packs/application.js ***!
  \*********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /Users/isurangaperera/RubymineProjects/ideals/app/app/javascript/packs/application.js: Support for the experimental syntax 'jsx' isn't currently enabled (17:9):\n\n  15 | function CustomNode({ data }) {\n  16 |     return (\n> 17 |         <div className=\"px-4 py-2 shadow-md rounded-md bg-white border-2 border-stone-400\">\n     |         ^\n  18 |             <div className=\"flex\">\n  19 |                 <div className=\"rounded-full w-12 h-12 flex justify-center items-center bg-gray-100\">\n  20 |                     {data.emoji}\n\nAdd @babel/preset-react (https://github.com/babel/babel/tree/main/packages/babel-preset-react) to the 'presets' section of your Babel config to enable transformation.\nIf you want to leave it as-is, add @babel/plugin-syntax-jsx (https://github.com/babel/babel/tree/main/packages/babel-plugin-syntax-jsx) to the 'plugins' section to enable parsing.\n    at instantiate (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:64:32)\n    at constructor (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:364:12)\n    at Parser.raise (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:3253:19)\n    at Parser.expectOnePlugin (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:3299:18)\n    at Parser.parseExprAtom (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:11209:18)\n    at Parser.parseExprSubscripts (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10859:23)\n    at Parser.parseUpdate (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10842:21)\n    at Parser.parseMaybeUnary (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10818:23)\n    at Parser.parseMaybeUnaryOrPrivate (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10656:61)\n    at Parser.parseExprOps (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10661:23)\n    at Parser.parseMaybeConditional (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10638:23)\n    at Parser.parseMaybeAssign (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10599:21)\n    at /Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10569:39\n    at Parser.allowInAnd (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12244:12)\n    at Parser.parseMaybeAssignAllowIn (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10569:17)\n    at Parser.parseParenAndDistinguishExpression (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:11477:28)\n    at Parser.parseExprAtom (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:11128:23)\n    at Parser.parseExprSubscripts (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10859:23)\n    at Parser.parseUpdate (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10842:21)\n    at Parser.parseMaybeUnary (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10818:23)\n    at Parser.parseMaybeUnaryOrPrivate (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10656:61)\n    at Parser.parseExprOps (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10661:23)\n    at Parser.parseMaybeConditional (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10638:23)\n    at Parser.parseMaybeAssign (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10599:21)\n    at Parser.parseExpressionBase (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10553:23)\n    at /Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10549:39\n    at Parser.allowInAnd (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12239:16)\n    at Parser.parseExpression (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:10549:17)\n    at Parser.parseReturnStatement (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12934:28)\n    at Parser.parseStatementContent (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12581:21)\n    at Parser.parseStatementLike (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12548:17)\n    at Parser.parseStatementListItem (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12528:17)\n    at Parser.parseBlockOrModuleBlockBody (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:13120:61)\n    at Parser.parseBlockBody (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:13113:10)\n    at Parser.parseBlock (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:13101:10)\n    at Parser.parseFunctionBody (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:11911:24)\n    at Parser.parseFunctionBodyAndFinish (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:11897:10)\n    at /Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:13256:12\n    at Parser.withSmartMixTopicForbiddingContext (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12221:14)\n    at Parser.parseFunction (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:13255:10)\n    at Parser.parseFunctionStatement (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12915:17)\n    at Parser.parseStatementContent (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12574:21)\n    at Parser.parseStatementLike (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12548:17)\n    at Parser.parseModuleItem (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12525:17)\n    at Parser.parseBlockOrModuleBlockBody (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:13120:36)\n    at Parser.parseBlockBody (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:13113:10)\n    at Parser.parseProgram (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12439:10)\n    at Parser.parseTopLevel (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:12429:25)\n    at Parser.parse (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:14250:10)\n    at parse (/Users/isurangaperera/RubymineProjects/ideals/app/node_modules/@babel/parser/lib/index.js:14292:38)");

/***/ })

/******/ });
//# sourceMappingURL=application-82d65a1759205e9bb7a9.js.map