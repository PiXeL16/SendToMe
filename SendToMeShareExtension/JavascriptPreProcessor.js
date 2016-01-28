var JavascriptPreProcessor = function() {};

JavascriptPreProcessor.prototype = {
run: function(arguments) {
    arguments.completionFunction({"title": document.title,
                                  "currentUrl" : document.URL });
}
};

var ExtensionPreprocessingJS = new JavascriptPreProcessor;
