from flask import Flask, request, jsonify
from flask_cors import CORS
from Ovasense import predict_from_hormones  # This is the function we created earlier

app = Flask(__name__)
CORS(app)  # Allow requests from FlutterFlow

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.json
        result = predict_from_hormones(data)
        return jsonify(result)
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(debug=True)
