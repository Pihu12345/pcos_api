from flask import Flask, request, jsonify
from flask_cors import CORS
import os
from Ovasense import predict_from_hormones  # Your ML function

import os  # Needed to get PORT from environment

app = Flask(__name__)
CORS(app)  # Allow requests from FlutterFlow or anywhere else

# Optional health check route (useful for Render)
@app.route('/')
def home():
    return "OvaSense API is running!"

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.json
        result = predict_from_hormones(data)
        return jsonify(result)
    except Exception as e:
        return jsonify({'error': str(e)}), 400

# THIS is the key bit for Render:
if __name__ == '__main__':
    port = int(os.environ.get("PORT", 10000))  # Render provides PORT
    app.run(host='0.0.0.0', port=port, debug=True)
