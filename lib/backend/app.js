
// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*", // Allow all domains (for testing)
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };

// app.use(cors(corsOptions)); // Handle CORS
// app.use(express.json()); // Parse JSON bodies
// app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies

// // User Schema
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] }, // Array to store selected items
// });

// const User = mongoose.model("User", userSchema);

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     // Check if the email is already registered
//     const existingUser = await User.findOne({ email });
//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     // Hash the password
//     const hashedPassword = await bcrypt.hash(password, 10);

//     // Create a new user
//     const newUser = new User({ name, phone, email, password: hashedPassword, dob });
//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during sign-up:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Save Preferences Route
// app.post("/save-preferences", async (req, res) => {
//   const { email, selectedItems } = req.body;

//   if (!email || !Array.isArray(selectedItems)) {
//     return res.status(400).json({ error: "Email and selected items are required" });
//   }

//   try {
//     // Find the user by email
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     // Update user's selected items
//     user.selectedItems = selectedItems;
//     await user.save();

//     res.status(200).json({ message: "Preferences updated successfully" });
//   } catch (err) {
//     console.error("Error saving preferences:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     // Find the user by email
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" }); // Email not found
//     }

//     // Compare the provided password with the hashed password
//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" }); // Incorrect password
//     }

//     // Login successful
//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems, // Send user preferences (optional)
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });
// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });




// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*", // Allow all domains (for testing)
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };

// app.use(cors(corsOptions)); // Handle CORS
// app.use(express.json()); // Parse JSON bodies
// app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies

// // User Schema
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] }, // Array to store selected items
// });

// const User = mongoose.model("User", userSchema);

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     // Check if the email is already registered
//     const existingUser = await User.findOne({ email });
//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     // Hash the password
//     const hashedPassword = await bcrypt.hash(password, 10);

//     // Create a new user
//     const newUser = new User({ name, phone, email, password: hashedPassword, dob });
//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during sign-up:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Save Preferences Route
// app.post("/save-preferences", async (req, res) => {
//   const { email, selectedItems } = req.body;

//   if (!email || !Array.isArray(selectedItems)) {
//     return res.status(400).json({ error: "Email and selected items are required" });
//   }

//   try {
//     // Find the user by email
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     // Update user's selected items
//     user.selectedItems = selectedItems;
//     await user.save();

//     res.status(200).json({ message: "Preferences updated successfully" });
//   } catch (err) {
//     console.error("Error saving preferences:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     // Find the user by email
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" }); // Email not found
//     }

//     // Compare the provided password with the hashed password
//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" }); // Incorrect password
//     }

//     // Login successful
//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems, // Send user preferences (optional)
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get User Data Route
// app.get("/get-user", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({
//       name: user.name,
//       email: user.email,
//       phone: user.phone,
//       workingAt: user.dob, // Return 'workingAt' from 'dob'
//       selectedItems: user.selectedItems,
//     });
//   } catch (err) {
//     console.error("Error fetching user data:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Update User's Working At Field
// app.post("/update-user", async (req, res) => {
//   const { email, workingAt } = req.body;

//   if (!email || !workingAt) {
//     return res.status(400).json({ error: "Email and workingAt are required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.dob = workingAt; // Save 'workingAt' in the 'dob' field
//     await user.save();

//     res.status(200).json({ message: "User updated successfully" });
//   } catch (err) {
//     console.error("Error updating user:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });


//test 2


// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*", // Allow all domains (for testing)
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };

// app.use(cors(corsOptions)); // Handle CORS
// app.use(express.json()); // Parse JSON bodies
// app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies

// // User Schema
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] }, // Array to store selected items
// });

// const User = mongoose.model("User", userSchema);

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     // Check if the email is already registered
//     const existingUser = await User.findOne({ email });
//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     // Hash the password
//     const hashedPassword = await bcrypt.hash(password, 10);

//     // Create a new user
//     const newUser = new User({ name, phone, email, password: hashedPassword, dob });
//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during sign-up:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Save Preferences Route
// app.post("/save-preferences", async (req, res) => {
//   const { email, selectedItems } = req.body;

//   if (!email || !Array.isArray(selectedItems)) {
//     return res.status(400).json({ error: "Email and selected items are required" });
//   }

//   try {
//     // Find the user by email
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     // Update user's selected items
//     user.selectedItems = selectedItems;
//     await user.save();

//     res.status(200).json({ message: "Preferences updated successfully" });
//   } catch (err) {
//     console.error("Error saving preferences:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     // Find the user by email
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     // Compare the provided password with the hashed password
//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems,
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get User Data Route
// app.get("/get-user", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({
//       name: user.name,
//       email: user.email,
//       phone: user.phone,
//       dob: user.dob,
//       selectedItems: user.selectedItems,
//     });
//   } catch (err) {
//     console.error("Error fetching user data:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Update User Preferences Route
// app.post("/update-user", async (req, res) => {
//   const { email, selectedItems } = req.body;

//   if (!email || !selectedItems) {
//     return res.status(400).json({ error: "Email and selectedItems are required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.selectedItems = selectedItems;
//     await user.save();

//     res.status(200).json({ message: "User updated successfully" });
//   } catch (err) {
//     console.error("Error updating user:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Catch-All Route for Undefined Endpoints
// app.use((req, res) => {
//   res.status(404).json({ error: "Endpoint not found" });
// });

// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });



//test 3 works

// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*", // Allow all domains (for testing)
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };

// app.use(cors(corsOptions)); // Handle CORS
// app.use(express.json()); // Parse JSON bodies
// app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies

// // User Schema
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] }, // Array to store selected items
// });

// const User = mongoose.model("User", userSchema);

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     // Check if the email is already registered
//     const existingUser = await User.findOne({ email });
//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     // Hash the password
//     const hashedPassword = await bcrypt.hash(password, 10);

//     // Create a new user
//     const newUser = new User({ name, phone, email, password: hashedPassword, dob });
//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during sign-up:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Save Preferences Route
// app.post("/save-preferences", async (req, res) => {
//   const { email, selectedItems } = req.body;

//   if (!email || !Array.isArray(selectedItems)) {
//     return res.status(400).json({ error: "Email and selected items are required" });
//   }

//   try {
//     // Find the user by email
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     // Update user's selected items
//     user.selectedItems = selectedItems;
//     await user.save();

//     res.status(200).json({ message: "Preferences updated successfully" });
//   } catch (err) {
//     console.error("Error saving preferences:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems,
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Catch-All Route for Undefined Endpoints
// app.use((req, res) => {
//   res.status(404).json({ error: "Endpoint not found" });
// });

// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });




//test 2

// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*", // Allow all domains (for testing)
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };

// app.use(cors(corsOptions)); // Handle CORS
// app.use(express.json()); // Parse JSON bodies
// app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies

// // User Schema
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] }, // Array to store selected items
//   workingAt: { type: String, default: "Unknown" }, // New field for current location
// });

// const User = mongoose.model("User", userSchema);

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     // Check if the email is already registered
//     const existingUser = await User.findOne({ email });
//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     // Hash the password
//     const hashedPassword = await bcrypt.hash(password, 10);

//     // Create a new user
//     const newUser = new User({ name, phone, email, password: hashedPassword, dob });
//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during sign-up:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Save Preferences Route
// app.post("/save-preferences", async (req, res) => {
//   const { email, selectedItems } = req.body;

//   if (!email || !Array.isArray(selectedItems)) {
//     return res.status(400).json({ error: "Email and selected items are required" });
//   }

//   try {
//     // Find the user by email
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     // Update user's selected items
//     user.selectedItems = selectedItems;
//     await user.save();

//     res.status(200).json({ message: "Preferences updated successfully" });
//   } catch (err) {
//     console.error("Error saving preferences:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems,
//         workingAt: user.workingAt, // Include workingAt in the login response
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get User Data Route
// app.get("/get-user", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({
//       name: user.name,
//       email: user.email,
//       phone: user.phone,
//       dob: user.dob,
//       selectedItems: user.selectedItems,
//       workingAt: user.workingAt, // Include workingAt in the response
//     });
//   } catch (err) {
//     console.error("Error fetching user data:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Catch-All Route for Undefined Endpoints
// app.use((req, res) => {
//   res.status(404).json({ error: "Endpoint not found" });
// });

// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });



//test 3

// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*", // Allow all domains (for testing)
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };

// app.use(cors(corsOptions)); // Handle CORS
// app.use(express.json()); // Parse JSON bodies
// app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies

// // User Schema
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] }, // Array to store selected items
//   workingAt: { type: String, default: "Unknown" }, // Added field for workingAt
//   currentlyAt: { type: String, default: "" }, // Added field for currentlyAt
// });

// const User = mongoose.model("User", userSchema);

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems,
//         workingAt: user.workingAt, // Include workingAt in the login response
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     // Check if the email is already registered
//     const existingUser = await User.findOne({ email });
//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     // Hash the password
//     const hashedPassword = await bcrypt.hash(password, 10);

//     // Create a new user
//     const newUser = new User({ name, phone, email, password: hashedPassword, dob });
//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during sign-up:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Save Preferences Route
// app.post("/save-preferences", async (req, res) => {
//   const { email, selectedItems } = req.body;

//   if (!email || !Array.isArray(selectedItems)) {
//     return res.status(400).json({ error: "Email and selected items are required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.selectedItems = selectedItems;
//     await user.save();

//     res.status(200).json({ message: "Preferences updated successfully" });
//   } catch (err) {
//     console.error("Error saving preferences:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Update Currently At Route
// app.post("/update-user", async (req, res) => {
//   const { email, currentlyAt } = req.body;

//   if (!email || !currentlyAt) {
//     return res.status(400).json({ error: "Email and currentlyAt are required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.currentlyAt = currentlyAt; // Update currentlyAt
//     await user.save();

//     res.status(200).json({ message: "User location updated successfully" });
//   } catch (err) {
//     console.error("Error updating user:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get User Data Route
// app.get("/get-user", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({
//       name: user.name,
//       email: user.email,
//       phone: user.phone,
//       dob: user.dob,
//       selectedItems: user.selectedItems,
//       workingAt: user.workingAt,
//       currentlyAt: user.currentlyAt, // Include currentlyAt in the response
//     });
//   } catch (err) {
//     console.error("Error fetching user data:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Catch-All Route for Undefined Endpoints
// app.use((req, res) => {
//   res.status(404).json({ error: "Endpoint not found" });
// });

// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });




//test 5 pass 


// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*", // Allow all domains (for testing)
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };

// app.use(cors(corsOptions)); // Handle CORS
// app.use(express.json()); // Parse JSON bodies
// app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies

// // User Schema
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] }, // Array to store selected items
//   workingAt: { type: String, default: "Unknown" }, // Added field for workingAt
//   currentlyAt: { type: String, default: "" }, // Added field for currentlyAt
// });

// const User = mongoose.model("User", userSchema);

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems,
//         workingAt: user.workingAt, // Include workingAt in the login response
//         currentlyAt: user.currentlyAt, // Include currentlyAt in the login response
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     // Check if the email is already registered
//     const existingUser = await User.findOne({ email });
//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     // Hash the password
//     const hashedPassword = await bcrypt.hash(password, 10);

//     // Create a new user
//     const newUser = new User({ name, phone, email, password: hashedPassword, dob });
//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during sign-up:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Save Preferences Route
// app.post("/save-preferences", async (req, res) => {
//   const { email, selectedItems } = req.body;

//   if (!email || !Array.isArray(selectedItems)) {
//     return res.status(400).json({ error: "Email and selected items are required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.selectedItems = selectedItems;
//     await user.save();

//     res.status(200).json({ message: "Preferences updated successfully" });
//   } catch (err) {
//     console.error("Error saving preferences:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Update Currently At Route
// app.post("/update-user", async (req, res) => {
//   const { email, currentlyAt } = req.body;

//   if (!email || !currentlyAt) {
//     return res.status(400).json({ error: "Email and currentlyAt are required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.currentlyAt = currentlyAt; // Update currentlyAt
//     await user.save();

//     res.status(200).json({ message: "User location updated successfully" });
//   } catch (err) {
//     console.error("Error updating user:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get User Data Route
// app.get("/get-user", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({
//       name: user.name,
//       email: user.email,
//       phone: user.phone,
//       dob: user.dob,
//       selectedItems: user.selectedItems,
//       workingAt: user.workingAt,
//       currentlyAt: user.currentlyAt, // Include currentlyAt in the response
//     });
//   } catch (err) {
//     console.error("Error fetching user data:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Catch-All Route for Undefined Endpoints
// app.use((req, res) => {
//   res.status(404).json({ error: "Endpoint not found" });
// });

// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });




//test 6


// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1); // Exit process if DB connection fails
//   });

// // Middleware
// const corsOptions = {
//   origin: "*", // Allow all domains for now (adjust as needed)
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };
// app.use(cors(corsOptions));
// app.use(express.json()); // Parse JSON request bodies
// app.use(express.urlencoded({ extended: true })); // Parse URL-encoded request bodies

// // Schema and Models
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] }, // Array of selected items
//   workingAt: { type: String, default: "Unknown" },
//   currentlyAt: { type: String, default: "" },
//   date: { type: String, required: true }, // ISO string for the date
//   content: { type: String, required: true }, // Reminder content
// });

// const User = mongoose.model("User", userSchema);

// // Routes

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems,
//         workingAt: user.workingAt,
//         currentlyAt: user.currentlyAt,
        
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     const existingUser = await User.findOne({ email: email.trim() });

//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     const hashedPassword = await bcrypt.hash(password, 10);

//     const newUser = new User({
//       name: name.trim(),
//       phone: phone.trim(),
//       email: email.trim(),
//       password: hashedPassword,
//       dob: dob.trim(),
      
//     });

//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during signup:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Save Preferences Route
// app.post("/save-preferences", async (req, res) => {
//   const { email, selectedItems } = req.body;

//   if (!email || !Array.isArray(selectedItems)) {
//     return res.status(400).json({ error: "Email and selected items are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.selectedItems = selectedItems;
//     await user.save();

//     res.status(200).json({ message: "Preferences updated successfully" });
//   } catch (err) {
//     console.error("Error saving preferences:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Update CurrentlyAt Route
// app.post("/update-user", async (req, res) => {
//   const { email, currentlyAt } = req.body;

//   if (!email || !currentlyAt) {
//     return res.status(400).json({ error: "Email and currentlyAt are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.currentlyAt = currentlyAt.trim();
//     await user.save();

//     res.status(200).json({ message: "User location updated successfully" });
//   } catch (err) {
//     console.error("Error updating user:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get User Data Route
// app.get("/get-user", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({
//       name: user.name,
//       email: user.email,
//       phone: user.phone,
//       dob: user.dob,
//       selectedItems: user.selectedItems,
//       workingAt: user.workingAt,
//       currentlyAt: user.currentlyAt,
      
//     });
//   } catch (err) {
//     console.error("Error fetching user data:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Catch-All Route for Undefined Endpoints
// app.use((req, res) => {
//   res.status(404).json({ error: "Endpoint not found" });
// });


// // Add Reminder Route
// app.post("/add-reminder", async (req, res) => {
//   const { email, date, content } = req.body;

//   if (!email || !date || !content) {
//     return res.status(400).json({ error: "Email, date, and content are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });
//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     // Assuming you have a reminders array in your User schema
//     if (!user.reminders) {
//       user.reminders = [];
//     }

//     user.reminders.push({ date, content });
//     await user.save();

//     res.status(201).json({ message: "Reminder added successfully" });
//   } catch (err) {
//     console.error("Error adding reminder:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get Reminders Route
// app.get("/get-reminders", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const reminders = await Reminder.find({ email: email.trim() });

//     if (!reminders.length) {
//       return res.status(404).json({ error: "No reminders found for this user" });
//     }

//     res.status(200).json({ reminders });
//   } catch (err) {
//     console.error("Error fetching reminders:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });


// test 7 works
// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*",
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };
// app.use(cors(corsOptions));
// app.use(express.json());
// app.use(express.urlencoded({ extended: true }));

// // Schema and Models
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] },
//   workingAt: { type: String, default: "Unknown" },
//   currentlyAt: { type: String, default: "" },
//   reminders: [
//     {
//       date: { type: String, required: true },
//       content: { type: String, required: true },
//     },
//   ],
//   scores: [
//     {
//       totalQuestions: { type: Number, required: true },
//       correctAnswers: { type: Number, required: true },
//       wrongAnswers: { type: Number, required: true },
//       topic: { type: String, required: true },
//       percentage: { type: Number, required: true },
//       type: { type: String, required: true }, // Added type field
//       date: { type: Date, default: Date.now },
//     },
//   ],
// });

// const User = mongoose.model("User", userSchema);

// // Routes

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems,
//         workingAt: user.workingAt,
//         currentlyAt: user.currentlyAt,
//         reminders: user.reminders,
//         scores: user.scores,
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     const existingUser = await User.findOne({ email: email.trim() });

//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     const hashedPassword = await bcrypt.hash(password, 10);

//     const newUser = new User({
//       name: name.trim(),
//       phone: phone.trim(),
//       email: email.trim(),
//       password: hashedPassword,
//       dob: dob.trim(),
//     });

//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during signup:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Save Preferences Route
// app.post("/save-preferences", async (req, res) => {
//   const { email, selectedItems } = req.body;

//   if (!email || !Array.isArray(selectedItems)) {
//     return res.status(400).json({ error: "Email and selected items are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.selectedItems = selectedItems;
//     await user.save();

//     res.status(200).json({ message: "Preferences updated successfully" });
//   } catch (err) {
//     console.error("Error saving preferences:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Update CurrentlyAt Route
// app.post("/update-user", async (req, res) => {
//   const { email, currentlyAt } = req.body;

//   if (!email || !currentlyAt) {
//     return res.status(400).json({ error: "Email and currentlyAt are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.currentlyAt = currentlyAt.trim();
//     await user.save();

//     res.status(200).json({ message: "User location updated successfully" });
//   } catch (err) {
//     console.error("Error updating user:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Add Score Route
// app.post("/add-score", async (req, res) => {
//   const { email, totalQuestions, correctAnswers, wrongAnswers, topic, percentage, type } = req.body;

//   if (!email || totalQuestions == null || correctAnswers == null || wrongAnswers == null || !topic || percentage == null || !type) {
//     return res.status(400).json({ error: "All score fields are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.scores.push({
//       totalQuestions,
//       correctAnswers,
//       wrongAnswers,
//       topic,
//       percentage,
//       type,
//     });

//     await user.save();

//     res.status(201).json({ message: "Score added successfully", scores: user.scores });
//   } catch (err) {
//     console.error("Error adding score:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get User Data Route
// app.get("/get-user", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({
//       name: user.name,
//       email: user.email,
//       phone: user.phone,
//       dob: user.dob,
//       selectedItems: user.selectedItems,
//       workingAt: user.workingAt,
//       currentlyAt: user.currentlyAt,
//       reminders: user.reminders,
//       scores: user.scores,
//     });
//   } catch (err) {
//     console.error("Error fetching user data:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // // Add Reminder Route
// app.post("/add-reminder", async (req, res) => {
//   const { email, date, content } = req.body;

//   if (!email || !date || !content) {
//     return res.status(400).json({ error: "Email, date, and content are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });
//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.reminders.push({ date, content });
//     await user.save();

//     res.status(201).json({ message: "Reminder added successfully" });
//   } catch (err) {
//     console.error("Error adding reminder:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get Reminders Route
// app.get("/get-reminders", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });
//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({ reminders: user.reminders });
//   } catch (err) {
//     console.error("Error fetching reminders:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Catch-All Route for Undefined Endpoints
// app.use((req, res) => {
//   res.status(404).json({ error: "Endpoint not found" });
// });

// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });

////////////////////////////////////////////////////////////////////////////////////////////////////////

// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*",
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };
// app.use(cors(corsOptions));
// app.use(express.json());
// app.use(express.urlencoded({ extended: true }));

// // Schema and Models
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] },
//   workingAt: { type: String, default: "Unknown" },
//   currentlyAt: { type: String, default: "" },
//   reminders: [
//     {
//       date: { type: String, required: true },
//       content: { type: String, required: true },
//     },
//   ],
//   scores: [
//     {
//       totalQuestions: { type: Number, required: true },
//       correctAnswers: { type: Number, required: true },
//       wrongAnswers: { type: Number, required: true },
//       topic: { type: String, required: true },
//       percentage: { type: Number, required: true },
//       type: { type: String, required: true }, // Added type field
//       date: { type: Date, default: Date.now },
//     },
//   ],
// });

// const User = mongoose.model("User", userSchema);

// // Routes

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems,
//         workingAt: user.workingAt,
//         currentlyAt: user.currentlyAt,
//         reminders: user.reminders,
//         scores: user.scores,
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Fetch Scores Route for ResultsPage
// app.get("/get-scores", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     // Filter out scores where "scores" field is not null
//     const filteredScores = user.scores.map((score) => ({
//       title: score.topic,
//       percentage: score.percentage,
//       date: score.date.toISOString().split("T")[0], // Format date as YYYY-MM-DD
//     }));

//     res.status(200).json({
//       name: user.name,
//       scores: filteredScores,
//     });
//   } catch (err) {
//     console.error("Error fetching scores:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     const existingUser = await User.findOne({ email: email.trim() });

//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     const hashedPassword = await bcrypt.hash(password, 10);

//     const newUser = new User({
//       name: name.trim(),
//       phone: phone.trim(),
//       email: email.trim(),
//       password: hashedPassword,
//       dob: dob.trim(),
//     });

//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during signup:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // // Add Reminder Route
// app.post("/add-reminder", async (req, res) => {
//   const { email, date, content } = req.body;

//   if (!email || !date || !content) {
//     return res.status(400).json({ error: "Email, date, and content are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });
//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.reminders.push({ date, content });
//     await user.save();

//     res.status(201).json({ message: "Reminder added successfully" });
//   } catch (err) {
//     console.error("Error adding reminder:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get Reminders Route
// app.get("/get-reminders", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });
//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({ reminders: user.reminders });
//   } catch (err) {
//     console.error("Error fetching reminders:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });


// // Add Score Route
// app.post("/add-score", async (req, res) => {
//   const { email, totalQuestions, correctAnswers, wrongAnswers, topic, percentage, type } = req.body;

//   if (!email || totalQuestions == null || correctAnswers == null || wrongAnswers == null || !topic || percentage == null || !type) {
//     return res.status(400).json({ error: "All score fields are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.scores.push({
//       totalQuestions,
//       correctAnswers,
//       wrongAnswers,
//       topic,
//       percentage,
//       type,
//     });

//     await user.save();

//     res.status(201).json({ message: "Score added successfully", scores: user.scores });
//   } catch (err) {
//     console.error("Error adding score:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get User Data Route
// app.get("/get-user", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({
//       name: user.name,
//       email: user.email,
//       phone: user.phone,
//       dob: user.dob,
//       selectedItems: user.selectedItems,
//       workingAt: user.workingAt,
//       currentlyAt: user.currentlyAt,
//       reminders: user.reminders,
//       scores: user.scores,
//     });
//   } catch (err) {
//     console.error("Error fetching user data:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Catch-All Route for Undefined Endpoints
// app.use((req, res) => {
//   res.status(404).json({ error: "Endpoint not found" });
// });

// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });


///////////////////////////////////////////////////////////////////////////////////////////////////
// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*",
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };
// app.use(cors(corsOptions));
// app.use(express.json());
// app.use(express.urlencoded({ extended: true }));

// // Schema and Models
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] },
//   workingAt: { type: String, default: "Unknown" },
//   currentlyAt: { type: String, default: "" },
//   reminders: [
//     {
//       date: { type: String, required: true },
//       content: { type: String, required: true },
//     },
//   ],
//   scores: [
//     {
//       totalQuestions: { type: Number, required: true },
//       correctAnswers: { type: Number, required: true },
//       wrongAnswers: { type: Number, required: true },
//       topic: { type: String, required: true },
//       percentage: { type: Number, required: true },
//       type: { type: String, required: true },
//       date: { type: Date, default: Date.now },
//       feedbacks: { type: [String], default: [] }, // New feedbacks field
//     },
//   ],
// });

// const User = mongoose.model("User", userSchema);

// // Routes

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems,
//         workingAt: user.workingAt,
//         currentlyAt: user.currentlyAt,
//         reminders: user.reminders,
//         scores: user.scores,
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Fetch Scores Route for ResultsPage
// app.get("/get-scores", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     const filteredScores = user.scores.map((score) => ({
//       title: score.topic,
//       percentage: score.percentage,
//       date: score.date.toISOString().split("T")[0],
//       feedbacks: score.feedbacks, // Include feedbacks in response
//     }));

//     res.status(200).json({
//       name: user.name,
//       scores: filteredScores,
//     });
//   } catch (err) {
//     console.error("Error fetching scores:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Add Score with Feedbacks Route
// app.post("/add-score", async (req, res) => {
//   const {
//     email,
//     totalQuestions,
//     correctAnswers,
//     wrongAnswers,
//     topic,
//     percentage,
//     type,
//     feedbacks,
//   } = req.body;

//   if (
//     !email ||
//     totalQuestions == null ||
//     correctAnswers == null ||
//     wrongAnswers == null ||
//     !topic ||
//     percentage == null ||
//     !type ||
//     !Array.isArray(feedbacks)
//   ) {
//     return res.status(400).json({ error: "All score fields are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.scores.push({
//       totalQuestions,
//       correctAnswers,
//       wrongAnswers,
//       topic,
//       percentage,
//       type,
//       feedbacks,
//     });

//     await user.save();

//     res.status(201).json({
//       message: "Score added successfully",
//       scores: user.scores,
//     });
//   } catch (err) {
//     console.error("Error adding score:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     const existingUser = await User.findOne({ email: email.trim() });

//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     const hashedPassword = await bcrypt.hash(password, 10);

//     const newUser = new User({
//       name: name.trim(),
//       phone: phone.trim(),
//       email: email.trim(),
//       password: hashedPassword,
//       dob: dob.trim(),
//     });

//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during signup:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Add Reminder Route
// app.post("/add-reminder", async (req, res) => {
//   const { email, date, content } = req.body;

//   if (!email || !date || !content) {
//     return res.status(400).json({ error: "Email, date, and content are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });
//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.reminders.push({ date, content });
//     await user.save();

//     res.status(201).json({ message: "Reminder added successfully" });
//   } catch (err) {
//     console.error("Error adding reminder:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get Reminders Route
// app.get("/get-reminders", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });
//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({ reminders: user.reminders });
//   } catch (err) {
//     console.error("Error fetching reminders:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get User Data Route
// app.get("/get-user", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({
//       name: user.name,
//       email: user.email,
//       phone: user.phone,
//       dob: user.dob,
//       selectedItems: user.selectedItems,
//       workingAt: user.workingAt,
//       currentlyAt: user.currentlyAt,
//       reminders: user.reminders,
//       scores: user.scores,
//     });
//   } catch (err) {
//     console.error("Error fetching user data:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Catch-All Route for Undefined Endpoints
// app.use((req, res) => {
//   res.status(404).json({ error: "Endpoint not found" });
// });

// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });







///////////////////////////////////////////////////////////////////////////////////////////////////////



// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*",
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };
// app.use(cors(corsOptions));
// app.use(express.json());
// app.use(express.urlencoded({ extended: true }));

// // Schema and Models
// const userSchema = new mongoose.Schema({
//   name: { type: String, required: true },
//   phone: { type: String, required: true },
//   email: { type: String, required: true, unique: true },
//   password: { type: String, required: true },
//   dob: { type: String, required: true },
//   selectedItems: { type: [String], default: [] },
//   workingAt: { type: String, default: "Unknown" },
//   currentlyAt: { type: String, default: "" },
//   reminders: [
//     {
//       date: { type: String, required: true },
//       content: { type: String, required: true },
//     },
//   ],
//   scores: [
//     {
//       totalQuestions: { type: Number, required: true },
//       correctAnswers: { type: Number, required: true },
//       wrongAnswers: { type: Number, required: true },
//       topic: { type: String, required: true },
//       percentage: { type: Number, required: true },
//       type: { type: String, required: true },
//       feedbacks: { type: [String], default: [] }, // Added feedbacks field
//       date: { type: Date, default: Date.now },
//     },
//   ],
// });

// const User = mongoose.model("User", userSchema);

// // Routes

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems,
//         workingAt: user.workingAt,
//         currentlyAt: user.currentlyAt,
//         reminders: user.reminders,
//         scores: user.scores,
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Fetch Scores Route for ResultsPage
// app.get("/get-scores", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     const filteredScores = user.scores.map((score) => ({
//       title: score.topic,
//       percentage: score.percentage,
//       date: score.date.toISOString().split("T")[0],
//       feedbacks: score.feedbacks, // Include feedbacks in response
//     }));

//     res.status(200).json({
//       name: user.name,
//       scores: filteredScores,
//     });
//   } catch (err) {
//     console.error("Error fetching scores:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Add Score with Feedbacks Route
// app.post("/add-score", async (req, res) => {
//   const {
//     email,
//     totalQuestions,
//     correctAnswers,
//     wrongAnswers,
//     topic,
//     percentage,
//     type,
//     feedbacks, // Accept feedbacks from the request body
//   } = req.body;

//   if (
//     !email ||
//     totalQuestions == null ||
//     correctAnswers == null ||
//     wrongAnswers == null ||
//     !topic ||
//     percentage == null ||
//     !type ||
//     !Array.isArray(feedbacks) // Ensure feedbacks is an array
//   ) {
//     return res.status(400).json({ error: "All score fields are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.scores.push({
//       totalQuestions,
//       correctAnswers,
//       wrongAnswers,
//       topic,
//       percentage,
//       type,
//       feedbacks, // Save feedbacks
//     });

//     await user.save();

//     res.status(201).json({
//       message: "Score added successfully",
//       scores: user.scores,
//     });
//   } catch (err) {
//     console.error("Error adding score:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     const existingUser = await User.findOne({ email: email.trim() });

//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     const hashedPassword = await bcrypt.hash(password, 10);

//     const newUser = new User({
//       name: name.trim(),
//       phone: phone.trim(),
//       email: email.trim(),
//       password: hashedPassword,
//       dob: dob.trim(),
//     });

//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during signup:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Add Reminder Route
// app.post("/add-reminder", async (req, res) => {
//   const { email, date, content } = req.body;

//   if (!email || !date || !content) {
//     return res.status(400).json({ error: "Email, date, and content are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });
//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.reminders.push({ date, content });
//     await user.save();

//     res.status(201).json({ message: "Reminder added successfully" });
//   } catch (err) {
//     console.error("Error adding reminder:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get Reminders Route
// app.get("/get-reminders", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });
//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({ reminders: user.reminders });
//   } catch (err) {
//     console.error("Error fetching reminders:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get User Data Route
// app.get("/get-user", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({
//       name: user.name,
//       email: user.email,
//       phone: user.phone,
//       dob: user.dob,
//       selectedItems: user.selectedItems,
//       workingAt: user.workingAt,
//       currentlyAt: user.currentlyAt,
//       reminders: user.reminders,
//       scores: user.scores,
//     });
//   } catch (err) {
//     console.error("Error fetching user data:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Catch-All Route for Undefined Endpoints
// app.use((req, res) => {
//   res.status(404).json({ error: "Endpoint not found" });
// });

// // Start Server
// app.listen(PORT, () => {
//   console.log(`Server running on http://localhost:${PORT}`);
// });
/////////////////////////////////////////////////////////////////////////////////////////////////////////

// const express = require("express");
// const mongoose = require("mongoose");
// const bcrypt = require("bcrypt");
// const cors = require("cors");

// const app = express();
// const PORT = 5000;

// // MongoDB Connection URI
// const mongoURI =
//   "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// // MongoDB Connection
// mongoose
//   .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => console.log("MongoDB connected successfully"))
//   .catch((err) => {
//     console.error("MongoDB connection error:", err.message);
//     process.exit(1);
//   });

// // Middleware
// const corsOptions = {
//   origin: "*",
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   allowedHeaders: ["Content-Type"],
// };
// app.use(cors(corsOptions));
// app.use(express.json());
// app.use(express.urlencoded({ extended: true }));

// // Schema and Models
// const userSchema = new mongoose.Schema({
//     name: { type: String, required: true },
//     phone: { type: String, required: true },
//     email: { type: String, required: true, unique: true },
//     password: { type: String, required: true },
//     dob: { type: String, required: true },
//     selectedItems: { type: [String], default: [] },
//     workingAt: { type: String, default: "Unknown" },
//     currentlyAt: { type: String, default: "" },
//     reminders: [
//       {
//         date: { type: String, required: true },
//         content: { type: String, required: true },
//       },
//     ],
//     scores: [
//       {
//         totalQuestions: { type: Number, required: true },
//         correctAnswers: { type: Number, required: true },
//         wrongAnswers: { type: Number, required: true },
//         topic: { type: String, required: true },
//         percentage: { type: Number, required: true },
//         type: { type: String, required: true },
//         feedbacks: { type: [String], default: [] }, // Added feedbacks field
//         date: { type: Date, default: Date.now },
//       },
//     ],
//   });
  
// const User = mongoose.model("User", userSchema);

// // Routes

// // Login Route
// app.post("/login", async (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: "Email and password are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     const isPasswordCorrect = await bcrypt.compare(password, user.password);

//     if (!isPasswordCorrect) {
//       return res.status(401).json({ error: "Invalid email or password" });
//     }

//     res.status(200).json({
//       message: "Login successful",
//       user: {
//         name: user.name,
//         email: user.email,
//         phone: user.phone,
//         dob: user.dob,
//         selectedItems: user.selectedItems,
//         workingAt: user.workingAt,
//         currentlyAt: user.currentlyAt,
//         reminders: user.reminders,
//         scores: user.scores,
//       },
//     });
//   } catch (err) {
//     console.error("Error during login:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, phone, email, password, dob } = req.body;

//   if (!name || !phone || !email || !password || !dob) {
//     return res.status(400).json({ error: "All fields are required" });
//   }

//   try {
//     const existingUser = await User.findOne({ email: email.trim() });

//     if (existingUser) {
//       return res.status(409).json({ error: "Email already registered" });
//     }

//     const hashedPassword = await bcrypt.hash(password, 10);

//     const newUser = new User({
//       name: name.trim(),
//       phone: phone.trim(),
//       email: email.trim(),
//       password: hashedPassword,
//       dob: dob.trim(),
//     });

//     await newUser.save();

//     res.status(201).json({ message: "User registered successfully" });
//   } catch (err) {
//     console.error("Error during signup:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Save Preferences Route
// app.post("/save-preferences", async (req, res) => {
//   const { email, selectedItems } = req.body;

//   if (!email || !Array.isArray(selectedItems)) {
//     return res.status(400).json({ error: "Email and selected items are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.selectedItems = selectedItems;
//     await user.save();

//     res.status(200).json({ message: "Preferences updated successfully" });
//   } catch (err) {
//     console.error("Error saving preferences:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Update CurrentlyAt Route
// app.post("/update-user", async (req, res) => {
//   const { email, currentlyAt } = req.body;

//   if (!email || !currentlyAt) {
//     return res.status(400).json({ error: "Email and currentlyAt are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.currentlyAt = currentlyAt.trim();
//     await user.save();

//     res.status(200).json({ message: "User location updated successfully" });
//   } catch (err) {
//     console.error("Error updating user:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Add Score Route
// app.post("/add-score", async (req, res) => {
//   const { email, totalQuestions, correctAnswers, wrongAnswers, topic, percentage, type } = req.body;

//   if (!email || totalQuestions == null || correctAnswers == null || wrongAnswers == null || !topic || percentage == null || !type) {
//     return res.status(400).json({ error: "All score fields are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.scores.push({
//       totalQuestions,
//       correctAnswers,
//       wrongAnswers,
//       topic,
//       percentage,
//       type,
//     });

//     await user.save();

//     res.status(201).json({ message: "Score added successfully", scores: user.scores });
//   } catch (err) {
//     console.error("Error adding score:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get User Data Route
// app.get("/get-user", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });

//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({
//       name: user.name,
//       email: user.email,
//       phone: user.phone,
//       dob: user.dob,
//       selectedItems: user.selectedItems,
//       workingAt: user.workingAt,
//       currentlyAt: user.currentlyAt,
//       reminders: user.reminders,
//       scores: user.scores,
//     });
//   } catch (err) {
//     console.error("Error fetching user data:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // // Add Reminder Route
// app.post("/add-reminder", async (req, res) => {
//   const { email, date, content } = req.body;

//   if (!email || !date || !content) {
//     return res.status(400).json({ error: "Email, date, and content are required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });
//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     user.reminders.push({ date, content });
//     await user.save();

//     res.status(201).json({ message: "Reminder added successfully" });
//   } catch (err) {
//     console.error("Error adding reminder:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Get Reminders Route
// app.get("/get-reminders", async (req, res) => {
//   const { email } = req.query;

//   if (!email) {
//     return res.status(400).json({ error: "Email is required" });
//   }

//   try {
//     const user = await User.findOne({ email: email.trim() });
//     if (!user) {
//       return res.status(404).json({ error: "User not found" });
//     }

//     res.status(200).json({ reminders: user.reminders });
//   } catch (err) {
//     console.error("Error fetching reminders:", err.message);
//     res.status(500).json({ error: "Internal server error" });
//   }
// });

// // Test Connectivity Route
// app.get("/test", (req, res) => {
//   res.status(200).json({ message: "Backend is reachable!" });
// });

// // Catch-All Route for Undefined Endpoints
// app.use((req, res) => {
//   res.status(404).json({ error: "Endpoint not found" });
// });

// // Start Server
// app.listen(PORT, () => {
//   //console.log(`Server running on http://localhost:${PORT}`);
//   //console.log(`Server running on http://192.168.137.189:${PORT}`);
//   console.log(`Server running on http://192.168.137.1:${PORT}`);
// });

const express = require("express");
const mongoose = require("mongoose");
const bcrypt = require('bcryptjs');
const cors = require("cors");
const axios = require("axios");
const app = express();
const PORT = 5000;



// MongoDB Connection URI
const mongoURI =
  "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority";

// MongoDB Connection
mongoose
  .connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("MongoDB connected successfully"))
  .catch((err) => {
    console.error("MongoDB connection error:", err.message);
    process.exit(1);
  });

// Middleware
const corsOptions = {
  origin: "*",
  methods: ["GET", "POST", "PUT", "DELETE"],
  allowedHeaders: ["Content-Type"],
};
app.use(cors(corsOptions));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Schema and Models
const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  phone: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  dob: { type: String, required: true },
  selectedItems: { type: [String], default: [] },
  workingAt: { type: String, default: "Unknown" },
  currentlyAt: { type: String, default: "" },
  reminders: [
    {
      date: { type: String, required: true },
      content: { type: String, required: true },
    },
  ],
  scores: [
    {
      totalQuestions: { type: Number, required: true },
      correctAnswers: { type: Number, required: true },
      wrongAnswers: { type: Number, required: true },
      topic: { type: String, required: true },
      percentage: { type: Number, required: true },
      type: { type: String, required: true },
      feedbacks: { type: [String], default: [] },
      tqs_list: { type: Array, default: [] }, 
      crans_list: { type: [String], default: [] },
      wrnans_list: { type: Array, default: [] }, 
      date: { type: Date, default: Date.now },
    },
  ],
});
const User = mongoose.model("User", userSchema);
GEMINI_API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyC4KWYk4Yazk7rSgUPYr1KI_2i2KGRw3hM"
// Routes
//GEMFEED
app.post("/generate-ai-analysis", async (req, res) => {
  const { email, crans_list, wrnans_list } = req.body;

  if (!email || !crans_list || !wrnans_list) {
    return res.status(400).json({ error: "Missing required fields" });
  }

  // Prepare AI Prompt
  const prompt = `
    Analyze the user's test performance:
    - Correct Answers: ${JSON.stringify(crans_list)}
    - Wrong Answers: ${JSON.stringify(wrnans_list)}
    
    Based on this, generate an analysis report highlighting:
    1. The topics where the user is strong.
    2. The topics where the user needs improvement.
    3. A personalized motivational message.
    dont use * or #
   `;

  try {
    const response = await axios.post(GEMINI_API_URL, {
      contents: [{ parts: [{ text: prompt }] }],
    });

    const aiAnalysis =
      response.data.candidates[0]?.content?.parts[0]?.text ||
      "AI analysis failed.";

    res.status(200).json({ analysis: aiAnalysis });
  } catch (error) {
    console.error("Error fetching AI analysis:", error.message);
    res.status(500).json({ error: "Failed to generate AI analysis" });
  }
});

// Login Route
app.post("/login", async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ error: "Email and password are required" });
  }

  try {
    const user = await User.findOne({ email: email.trim() });

    if (!user) {
      return res.status(401).json({ error: "Invalid email or password" });
    }

    const isPasswordCorrect = await bcrypt.compare(password, user.password);

    if (!isPasswordCorrect) {
      return res.status(401).json({ error: "Invalid email or password" });
    }

    res.status(200).json({
      message: "Login successful",
      user: {
        name: user.name,
        email: user.email,
        phone: user.phone,
        dob: user.dob,
        selectedItems: user.selectedItems,
        workingAt: user.workingAt,
        currentlyAt: user.currentlyAt,
        reminders: user.reminders,
        scores: user.scores,
      },
    });
  } catch (err) {
    console.error("Error during login:", err.message);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Signup Route
app.post("/signup", async (req, res) => {
  const { name, phone, email, password, dob } = req.body;

  if (!name || !phone || !email || !password || !dob) {
    return res.status(400).json({ error: "All fields are required" });
  }

  try {
    const existingUser = await User.findOne({ email: email.trim() });

    if (existingUser) {
      return res.status(409).json({ error: "Email already registered" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = new User({
      name: name.trim(),
      phone: phone.trim(),
      email: email.trim(),
      password: hashedPassword,
      dob: dob.trim(),
    });

    await newUser.save();

    res.status(201).json({ message: "User registered successfully" });
  } catch (err) {
    console.error("Error during signup:", err.message);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Save Preferences Route
app.post("/save-preferences", async (req, res) => {
  const { email, selectedItems } = req.body;

  if (!email || !Array.isArray(selectedItems)) {
    return res.status(400).json({ error: "Email and selected items are required" });
  }

  try {
    const user = await User.findOne({ email: email.trim() });

    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    user.selectedItems = selectedItems;
    await user.save();

    res.status(200).json({ message: "Preferences updated successfully" });
  } catch (err) {
    console.error("Error saving preferences:", err.message);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Update CurrentlyAt Route
app.post("/update-user", async (req, res) => {
  const { email, currentlyAt } = req.body;

  if (!email || !currentlyAt) {
    return res.status(400).json({ error: "Email and currentlyAt are required" });
  }

  try {
    const user = await User.findOne({ email: email.trim() });

    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    user.currentlyAt = currentlyAt.trim();
    await user.save();

    res.status(200).json({ message: "User location updated successfully" });
  } catch (err) {
    console.error("Error updating user:", err.message);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Add Score Route
app.post("/add-score", async (req, res) => {
  const { email, totalQuestions, correctAnswers, wrongAnswers, topic, percentage, type, tqs_list, crans_list, wrnans_list } = req.body;

  if (!email || totalQuestions == null || correctAnswers == null || wrongAnswers == null || !topic || percentage == null || !type || !tqs_list || !crans_list || !wrnans_list) {
    return res.status(400).json({ error: "All score fields are required, including question lists" });
  }

  try {
    const user = await User.findOne({ email: email.trim() });

    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    
    user.scores.push({
      totalQuestions,
      correctAnswers,
      wrongAnswers,
      topic,
      percentage,
      type,
      tqs_list,  
      crans_list,  
      wrnans_list,  
    });

    await user.save();

    res.status(201).json({ message: "Score added successfully", scores: user.scores });
  } catch (err) {
    console.error("Error adding score:", err.message);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Get User Data Route
app.get("/get-user", async (req, res) => {
  const { email } = req.query;

  if (!email) {
    return res.status(400).json({ error: "Email is required" });
  }

  try {
    const user = await User.findOne({ email: email.trim() });

    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    res.status(200).json({
      name: user.name,
      email: user.email,
      phone: user.phone,
      dob: user.dob,
      selectedItems: user.selectedItems,
      workingAt: user.workingAt,
      currentlyAt: user.currentlyAt,
      reminders: user.reminders,
      scores: user.scores,
    });
  } catch (err) {
    console.error("Error fetching user data:", err.message);
    res.status(500).json({ error: "Internal server error" });
  }
});

// // Add Reminder Route
app.post("/add-reminder", async (req, res) => {
  const { email, date, content } = req.body;

  if (!email || !date || !content) {
    return res.status(400).json({ error: "Email, date, and content are required" });
  }

  try {
    const user = await User.findOne({ email: email.trim() });
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    user.reminders.push({ date, content });
    await user.save();

    res.status(201).json({ message: "Reminder added successfully" });
  } catch (err) {
    console.error("Error adding reminder:", err.message);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Get Reminders Route
app.get("/get-reminders", async (req, res) => {
  const { email } = req.query;

  if (!email) {
    return res.status(400).json({ error: "Email is required" });
  }

  try {
    const user = await User.findOne({ email: email.trim() });
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    res.status(200).json({ reminders: user.reminders });
  } catch (err) {
    console.error("Error fetching reminders:", err.message);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Test Connectivity Route
app.get("/test", (req, res) => {
  res.status(200).json({ message: "Backend is reachable!" });
});

// Catch-All Route for Undefined Endpoints
app.use((req, res) => {
  res.status(404).json({ error: "Endpoint not found" });
});

// Start Server
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server running on http://10.0.2.2:${PORT}`);
});
