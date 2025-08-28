const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send(`
    <html>
    <head>
        <title>DevOps Learning App - Sreenath92</title>
        <style>
            body { 
                font-family: 'Segoe UI', Arial, sans-serif; 
                margin: 0; padding: 40px; 
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
            }
            .container { 
                max-width: 900px; margin: 0 auto; 
                background: rgba(255,255,255,0.1); 
                padding: 40px; border-radius: 15px; 
                backdrop-filter: blur(10px);
                box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            }
            h1 { font-size: 2.5em; margin-bottom: 30px; text-align: center; }
            .info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin: 30px 0; }
            .info-card { 
                background: rgba(255,255,255,0.1); 
                padding: 20px; border-radius: 10px;
                border: 1px solid rgba(255,255,255,0.2);
            }
            .status { color: #4ade80; font-weight: bold; font-size: 1.2em; }
            ul { list-style: none; padding: 0; }
            li { padding: 5px 0; }
            li:before { content: "✅ "; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>🚀 DevOps Learning Application</h1>
            
            <div class="info-grid">
                <div class="info-card">
                    <h3>📋 Project Info</h3>
                    <p><strong>Developer:</strong> Sreenath92</p>
                    <p><strong>Environment:</strong> ${process.env.NODE_ENV || 'development'}</p>
                    <p><strong>Version:</strong> 1.0.0</p>
                    <p><strong>Container:</strong> Docker Ready</p>
                </div>
                
                <div class="info-card">
                    <h3>⏰ Runtime Info</h3>
                    <p><strong>Started:</strong> ${new Date().toLocaleString()}</p>
                    <p><strong>Uptime:</strong> ${Math.floor(process.uptime())} seconds</p>
                    <p class="status">🟢 Application Running</p>
                </div>
            </div>
            
            <div class="info-card">
                <h3>🎯 DevOps Skills Practiced</h3>
                <ul>
                    <li>Git version control and GitHub integration</li>
                    <li>Docker containerization and best practices</li>
                    <li>Node.js application development</li>
                    <li>Environment configuration management</li>
                    <li>Health monitoring and API endpoints</li>
                </ul>
            </div>
        </div>
    </body>
    </html>
  `);
});

app.get('/api/health', (req, res) => {
  res.json({ 
    status: 'healthy',
    service: 'devops-learning-app',
    timestamp: new Date().toISOString(),
    version: '1.0.0',
    environment: process.env.NODE_ENV || 'development',
    uptime: process.uptime()
  });
});

app.get('/api/info', (req, res) => {
  res.json({
    application: 'DevOps Learning Application',
    author: 'Sreenath92',
    version: '1.0.0',
    description: 'Sample application for practicing DevOps skills',
    technologies: ['Node.js', 'Express.js', 'Docker'],
    features: ['Health checks', 'Environment configs', 'Container ready'],
    endpoints: {
      home: '/',
      health: '/api/health', 
      info: '/api/info'
    }
  });
});

const server = app.listen(port, () => {
  console.log(`🌟 DevOps Learning App started successfully!`);
  console.log(`🔗 Application URL: http://localhost:${port}`);
  console.log(`❤️  Health Check: http://localhost:${port}/api/health`);
  console.log(`ℹ️  API Info: http://localhost:${port}/api/info`);
  console.log(`📝 Author: Sreenath92`);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  console.log('🛑 Received SIGTERM, shutting down gracefully...');
  server.close(() => {
    console.log('✅ Process terminated');
  });
});
