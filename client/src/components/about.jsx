import { Typography } from "@mui/material"
import { Box, Container } from "@mui/system"
import Copyright from "./Copyright"

const About = () => {
  return (
    <>
      <Container maxWidth='md' sx={{
        bgcolor: 'background.paper',
        boxShadow: 2,
        my: 10,
        py: 10
      }}>
        <div align="center">
          <img src="/static/logo.png" alt="Logo" width="80" height="80" />
          <h2 align="center">SplitApp</h2>
          <p align="center">
            A group expense splitting app built with the MERN stack.
          </p>
        </div>

        <br />

        <Typography variant="h5" gutterBottom>Key Features</Typography>
        <ul style={{ marginLeft: '40px' }}>
          <li>Create user groups and track group expenses</li>
          <li>Keep track of shared expenses and settle balances easily</li>
          <li>Analytical graphs to understand your expenditure trends</li>
          <li>Multiple user registration and authentication</li>
          <li>Secure login using JSON Web Tokens (JWT)</li>
        </ul>

        <br />

        <Typography variant="h5" gutterBottom>Technologies Used</Typography>

        <Typography variant="h6" gutterBottom sx={{ mt: 2 }}>Frontend</Typography>
        <ul style={{ marginLeft: '40px' }}>
          <li>React JS</li>
          <li>Redux</li>
          <li>Axios</li>
          <li>Material UI</li>
          <li>Chart.js</li>
        </ul>

        <Typography variant="h6" gutterBottom sx={{ mt: 2 }}>Backend</Typography>
        <ul style={{ marginLeft: '40px' }}>
          <li>Node.js + Express</li>
          <li>Mongoose</li>
          <li>JWT Authentication</li>
          <li>bcryptjs</li>
        </ul>

        <Typography variant="h6" gutterBottom sx={{ mt: 2 }}>Database</Typography>
        <ul style={{ marginLeft: '40px' }}>
          <li>MongoDB Atlas</li>
        </ul>

        <br />
        <Box sx={{ textAlign: 'center', mt: 4 }}>
          <Copyright />
        </Box>
      </Container>
    </>
  )
}

export default About