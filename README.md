# Jay's Personal Website

A minimalist photography and blog website built with Hugo.

## Features

- Responsive design with mobile support
- Photography gallery with optimized images
- Blog section
- Dark theme
- Fast loading times with image optimization

## Local Development

To run the site locally:

```bash
# Install Hugo (if not already installed)
# macOS: 
brew install hugo

# Run development server
hugo server

# Build for production
hugo --minify
```

## Image Optimization

This site uses Hugo's built-in image processing for optimal performance:

- Images are placed in the `assets/images/` directory
- Hugo automatically generates responsive images in multiple sizes
- Images are lazy-loaded for better performance
- Proper aspect ratios are maintained using smart cropping

## Deployment

The site is automatically deployed to GitHub Pages using GitHub Actions.

## License

All content is copyright © Jay unless otherwise specified. 