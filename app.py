from flask import Flask, render_template, request, redirect, session
import mysql.connector

app = Flask(__name__)
app.secret_key = "your_secret_key"

# Connect to MySQL
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="your_database"
)
cursor = db.cursor()

@app.route('/')
def home():
    return render_template('index.html')  # Load your login page

@app.route('/register', methods=['POST'])
def register():
    username = request.form['username']
    password = request.form['password']  # You may store hashed passwords
    cursor.execute("INSERT INTO users (username, password) VALUES (%s, %s)", (username, password))
    db.commit()
    return redirect('/')

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']
    cursor.execute("SELECT * FROM users WHERE username=%s AND password=%s", (username, password))
    user = cursor.fetchone()
    if user:
        session['user'] = username
        return redirect('/dashboard')
    return "Invalid Credentials"

@app.route('/dashboard')
def dashboard():
    if 'user' in session:
        return render_template('dashboard.html', user=session['user'])
    return redirect('/')

if __name__ == "__main__":
    app.run(debug=True)
