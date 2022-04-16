from flask import Flask, render_template
import os

app = Flask(__name__)


@app.route("/")
def hello_world():
    query = os.getenv("SEARCH_QUERY", "oops")
    return render_template("index.html", query=query)


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=3000)
