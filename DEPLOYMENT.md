# Deploying to Cloudflare Pages

This guide will help you deploy the WoW Classic simulator to Cloudflare Pages.

## Prerequisites

- A Cloudflare account (free)
- Your code pushed to a Git repository (GitHub, GitLab, etc.)

## Deployment Steps

### 1. Build the Project

The project is already configured for Cloudflare Pages deployment. The build command is:

```bash
npm run build:pages
```

This will:
- Generate all protobuf TypeScript files (if protobuf is available)
- Build the Vite application for production
- Create optimized static files in `dist/classic/`

### 2. Deploy to Cloudflare Pages

#### Option A: Using Cloudflare Dashboard (Recommended)

1. **Go to Cloudflare Dashboard**
   - Visit [dash.cloudflare.com](https://dash.cloudflare.com)
   - Sign in to your account

2. **Create a new Pages project**
   - Click "Pages" in the sidebar
   - Click "Create a project"
   - Choose "Connect to Git"

3. **Connect your repository**
   - Select your Git provider (GitHub, GitLab, etc.)
   - Choose your repository
   - Authorize Cloudflare

4. **Configure build settings**
   - **Project name**: `wowsim-classic` (or your preferred name)
   - **Production branch**: `master` (or your default branch)
   - **Framework preset**: `None`
   - **Build command**: `npm run build:pages`
   - **Build output directory**: `dist/classic`
   - **Root directory**: `/` (leave empty)

5. **Environment variables** (if needed):
   - No environment variables required for this project

6. **Deploy**
   - Click "Save and Deploy"
   - Wait for the build to complete

#### Option B: Using Wrangler CLI

1. **Install Wrangler**
   ```bash
   npm install -g wrangler
   ```

2. **Login to Cloudflare**
   ```bash
   wrangler login
   ```

3. **Deploy**
   ```bash
   wrangler pages deploy dist/classic --project-name=wowsim-classic
   ```

### 3. Custom Domain (Optional)

After deployment, you can add a custom domain:

1. Go to your Pages project in the Cloudflare dashboard
2. Click "Custom domains"
3. Add your domain
4. Update DNS settings as instructed

### 4. Automatic Deployments

Once set up, Cloudflare Pages will automatically:
- Build and deploy when you push to your main branch
- Provide preview deployments for pull requests
- Handle HTTPS certificates automatically
- Serve your site from a global CDN

## Project Structure

The built site will have the following structure:
```
/classic/                    # Main entry point
/classic/balance_druid/      # Balance Druid simulator
/classic/feral_druid/        # Feral Druid simulator
/classic/hunter/             # Hunter simulator
/classic/mage/               # Mage simulator
/classic/rogue/              # Rogue simulator
/classic/warrior/            # Warrior simulator
/classic/tank_warrior/       # Tank Warrior simulator
/classic/paladin/            # Paladin simulators
/classic/priest/             # Priest simulators
/classic/shaman/             # Shaman simulators
/classic/warlock/            # Warlock simulator
/classic/raid/               # Raid simulator
/classic/detailed_results/   # Detailed results page
```

## Troubleshooting

### Build Issues
- Ensure Node.js version 20+ is used
- Check that all dependencies are installed: `npm install`
- The build script handles protobuf availability automatically

### Routing Issues
- The `_redirects` file handles client-side routing
- All routes should work correctly with the current configuration

### Performance
- The site is optimized for production with minified assets
- Large chunks are split for better loading performance
- Assets are served from Cloudflare's global CDN

## Cost

Cloudflare Pages is **completely free** for:
- Unlimited sites
- 500 builds per month
- 100,000 requests per day
- Global CDN
- Automatic HTTPS

This is more than sufficient for most projects! 