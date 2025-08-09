# 🐳 Dockerfile Generator

A GenAI-powered tool that generates optimized Dockerfiles based on programming language input.  
This project uses [Ollama](https://ollama.com/) with the Llama3 model to create Dockerfiles following best practices.

---

## 📋 Prerequisites

### 1. **Python 3.8+**  
Make sure you have Python installed. You can check with:
```bash
python3 --version
```

### 2. **Ollama**

#### Download and Install Ollama

**For Linux:**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**For MacOS:**
```bash
brew install ollama
```

#### Start Ollama Service
```bash
ollama serve
```

#### Pull the Llama3 Model
```bash
ollama pull llama3.2:1b
```

---

## 🚀 Project Setup

### 1. **Clone the Repository**
```bash
git clone https://github.com/<your-username>/dockerfile-generator.git
cd dockerfile-generator
```

### 2. **Create Virtual Environment**
```bash
python3 -m venv venv
source venv/bin/activate  # On Linux/MacOS
# or
.\venv\Scripts\activate   # On Windows
```

### 3. **Install Dependencies**

Install the required Python packages:
```bash
pip3 install -r requirements.txt
```

> **Note:**  
> The script depends on the `ollama` Python package. Add the following line to your `requirements.txt` if not present:
> ```
> ollama
> ```

---

## 🏃 Run the Application

```bash
python3 generate_dockerfile.py
```

---

## 💡 How It Works

- The script takes a programming language as input (e.g., Python, Node.js, Java)
- Connects to the locally running Ollama API
- Generates an optimized Dockerfile with best practices for the specified language
- Returns the Dockerfile content

---

## 📝 Example Usage

```bash
python3 generate_dockerfile.py
```
```
Enter the programming language: python
# Generated Dockerfile will be displayed...
```

---

## 🏆 Troubleshooting

- Make sure the Ollama service is running **before** executing the script:
  ```bash
  ollama serve
  ```
- Ensure the correct model (`llama3.2:1b`) is downloaded.
- If you encounter a `ModuleNotFoundError`, install dependencies using:
  ```bash
  pip3 install -r requirements.txt
  ```
- Adapt best practices for other programming languages as needed.

---

## 📄 License

MIT