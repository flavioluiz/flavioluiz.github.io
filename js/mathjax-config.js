// MathJax Configuration
window.MathJax = {
    jax: ["input/TeX", "output/SVG"],
    extensions: ["tex2jax.js"],
    SVG: {
        scale: 120,
        linebreaks: { automatic: true },
        font: "TeX",
        styles: {
            ".MathJax_SVG": {
                "vertical-align": "0"
            }
        }
    },
    TeX: {
        extensions: ["AMSmath.js", "AMSsymbols.js"],
        equationNumbers: { autoNumber: "AMS" }
    },
    tex2jax: {
        inlineMath: [['$','$']],
        displayMath: [['$$','$$']],
        processEscapes: true,
        processEnvironments: true
    },
    "HTML-CSS": { linebreaks: { automatic: true } },
    messageStyle: "none"
}; 