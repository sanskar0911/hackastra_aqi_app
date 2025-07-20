from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/aqi', methods=['GET'])
def get_aqi():
    lat = float(request.args.get('lat', 0))
    lon = float(request.args.get('lon', 0))

    if 19.0 <= lat <= 19.2 and 73.0 <= lon <= 73.2:
        aqi = 165
        level = "Unhealthy"
    else:
        aqi = 75
        level = "Moderate"

    return jsonify({"aqi": aqi, "level": level})

@app.route('/forecast', methods=['GET'])
def get_forecast():
    forecast_data = [165, 160, 155, 140, 130, 125, 110, 100, 90, 85]
    return jsonify({"forecast": forecast_data})

if __name__ == '__main__':
    print("🟢 AQI Flask server running at http://localhost:5000")
    app.run(debug=True, host='0.0.0.0', port=5000)
