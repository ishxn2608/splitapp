// Simple web interface to view MongoDB data
require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const model = require('./model/schema');

const app = express();
const PORT = 3002;

// Connect to MongoDB
mongoose.connect(process.env.MONGODB_URI)
  .then(() => console.log('✅ Connected to MongoDB'))
  .catch(err => console.error('❌ MongoDB connection error:', err));

// Serve HTML page
app.get('/', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
      <title>MongoDB Viewer - SplitApp</title>
      <style>
        body {
          font-family: Arial, sans-serif;
          max-width: 1200px;
          margin: 0 auto;
          padding: 20px;
          background: #f5f5f5;
        }
        h1 {
          color: #333;
          text-align: center;
        }
        .nav {
          display: flex;
          gap: 10px;
          margin: 20px 0;
          justify-content: center;
        }
        button {
          padding: 10px 20px;
          background: #007bff;
          color: white;
          border: none;
          border-radius: 5px;
          cursor: pointer;
          font-size: 16px;
        }
        button:hover {
          background: #0056b3;
        }
        .container {
          background: white;
          padding: 20px;
          border-radius: 8px;
          box-shadow: 0 2px 4px rgba(0,0,0,0.1);
          margin-top: 20px;
        }
        table {
          width: 100%;
          border-collapse: collapse;
          margin-top: 20px;
        }
        th, td {
          padding: 12px;
          text-align: left;
          border-bottom: 1px solid #ddd;
        }
        th {
          background: #007bff;
          color: white;
        }
        tr:hover {
          background: #f5f5f5;
        }
        .count {
          font-size: 18px;
          color: #666;
          margin: 10px 0;
        }
        pre {
          background: #f4f4f4;
          padding: 10px;
          border-radius: 4px;
          overflow-x: auto;
        }
      </style>
    </head>
    <body>
      <h1>🗄️ MongoDB Database Viewer</h1>
      <p style="text-align: center; color: #666;">SplitApp Database Explorer</p>
      
      <div class="nav">
        <button onclick="loadData('users')">👥 View Users</button>
        <button onclick="loadData('groups')">📁 View Groups</button>
        <button onclick="loadData('expenses')">💰 View Expenses</button>
        <button onclick="loadData('settlements')">✅ View Settlements</button>
        <button onclick="loadData('stats')">📊 Database Stats</button>
      </div>
      
      <div class="container" id="content">
        <p style="text-align: center; color: #999;">Select a collection to view data</p>
      </div>
      
      <script>
        async function loadData(type) {
          const content = document.getElementById('content');
          content.innerHTML = '<p style="text-align: center;">Loading...</p>';
          
          try {
            const response = await fetch('/api/' + type);
            const data = await response.json();
            
            if (type === 'stats') {
              displayStats(data);
            } else {
              displayTable(data, type);
            }
          } catch (error) {
            content.innerHTML = '<p style="color: red;">Error loading data: ' + error.message + '</p>';
          }
        }
        
        function displayStats(data) {
          const content = document.getElementById('content');
          content.innerHTML = \`
            <h2>📊 Database Statistics</h2>
            <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px; margin-top: 20px;">
              <div style="background: #e3f2fd; padding: 20px; border-radius: 8px;">
                <h3>👥 Users</h3>
                <p style="font-size: 32px; margin: 10px 0;">\${data.users}</p>
              </div>
              <div style="background: #f3e5f5; padding: 20px; border-radius: 8px;">
                <h3>📁 Groups</h3>
                <p style="font-size: 32px; margin: 10px 0;">\${data.groups}</p>
              </div>
              <div style="background: #fff3e0; padding: 20px; border-radius: 8px;">
                <h3>💰 Expenses</h3>
                <p style="font-size: 32px; margin: 10px 0;">\${data.expenses}</p>
              </div>
              <div style="background: #e8f5e9; padding: 20px; border-radius: 8px;">
                <h3>✅ Settlements</h3>
                <p style="font-size: 32px; margin: 10px 0;">\${data.settlements}</p>
              </div>
            </div>
          \`;
        }
        
        function displayTable(data, type) {
          const content = document.getElementById('content');
          
          if (!data || data.length === 0) {
            content.innerHTML = '<p style="text-align: center; color: #999;">No data found in ' + type + ' collection</p>';
            return;
          }
          
          let html = '<div class="count">Total Records: ' + data.length + '</div>';
          html += '<div style="overflow-x: auto;"><table><thead><tr>';
          
          // Get headers from first object
          const headers = Object.keys(data[0]);
          headers.forEach(header => {
            if (header !== '__v') {
              html += '<th>' + header + '</th>';
            }
          });
          html += '</tr></thead><tbody>';
          
          // Add rows
          data.forEach(item => {
            html += '<tr>';
            headers.forEach(header => {
              if (header !== '__v') {
                let value = item[header];
                if (typeof value === 'object') {
                  value = JSON.stringify(value);
                }
                if (header === 'password') {
                  value = '••••••••';
                }
                html += '<td>' + (value || '-') + '</td>';
              }
            });
            html += '</tr>';
          });
          
          html += '</tbody></table></div>';
          content.innerHTML = html;
        }
      </script>
    </body>
    </html>
  `);
});

// API endpoints
app.get('/api/users', async (req, res) => {
  try {
    const users = await model.User.find({}, { password: 0 }).lean();
    res.json(users);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/groups', async (req, res) => {
  try {
    const groups = await model.Group.find({}).lean();
    res.json(groups);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/expenses', async (req, res) => {
  try {
    const expenses = await model.Expense.find({}).lean();
    res.json(expenses);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/settlements', async (req, res) => {
  try {
    const settlements = await model.Settlement.find({}).lean();
    res.json(settlements);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/stats', async (req, res) => {
  try {
    const stats = {
      users: await model.User.countDocuments(),
      groups: await model.Group.countDocuments(),
      expenses: await model.Expense.countDocuments(),
      settlements: await model.Settlement.countDocuments()
    };
    res.json(stats);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`\n🌐 MongoDB Viewer running at: http://localhost:${PORT}`);
  console.log(`📊 Open your browser and visit: http://localhost:${PORT}\n`);
});
