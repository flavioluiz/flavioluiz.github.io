// MathJax Configuration
window.MathJax = {
    tex: {
        inlineMath: [['$', '$']],
        displayMath: [['$$', '$$']],
        packages: ['base', 'ams', 'noerrors', 'noundefined'],
        macros: {
            // Add any custom macros here
        }
    },
    svg: {
        fontCache: 'global'
    },
    options: {
        enableMenu: true,  // Enable the MathJax menu for debugging
        processHtmlClass: 'tex2jax_process',
        ignoreHtmlClass: 'tex2jax_ignore'
    },
    startup: {
        ready: () => {
            console.log('MathJax is loaded, but not yet initialized');
            MathJax.startup.defaultReady();
            console.log('MathJax is initialized');
        }
    },
    chtml: {
        fontURL: 'https://cdn.jsdelivr.net/npm/mathjax@3/es5/output/chtml/fonts/woff-v2'
    }
}; 