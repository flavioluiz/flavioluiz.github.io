async function loadMarkdown() {
    try {
        // Get the current page name from the URL
        let pageName = window.location.pathname.split('/').pop().replace('.html', '');
        
        // Handle root path and index cases
        if (pageName === '' || pageName === 'index') {
            pageName = 'welcome';
        }

        console.log('Loading markdown for page:', pageName);
        
        const response = await fetch(`../markdown/${pageName}.md`);
        if (!response.ok) {
            throw new Error(`Failed to load markdown: ${response.statusText}`);
        }
        
        const markdown = await response.text();
        console.log('Markdown loaded successfully');
        
        // Remove YAML front matter
        const content = markdown.replace(/---[\s\S]*?---/, "").trim();
        
        const converter = new showdown.Converter({
            tables: true,
            strikethrough: true,
            ghCodeBlocks: true
        });
        
        // Update image paths in the markdown content
        const updatedContent = content.replace(/!\[([^\]]*)\]\(images\//g, '![$1](../images/');
        const html = converter.makeHtml(updatedContent);
        document.getElementById("content").innerHTML = html;
        
        // Wait for MathJax to be ready and typeset
        if (typeof MathJax !== 'undefined' && MathJax.Hub) {
            console.log('MathJax found, starting typeset');
            MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
            console.log('MathJax typesetting queued');
        }
    } catch (error) {
        console.error('Error loading markdown:', error);
        document.getElementById("content").innerHTML = `
            <p>Error loading content. Please try again later.</p>
            <p>Details: ${error.message}</p>
        `;
    }
}

// Wait for DOM to be ready
document.addEventListener('DOMContentLoaded', loadMarkdown);