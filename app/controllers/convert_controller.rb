class ConvertController < ApplicationController
    def input
        
    end

    def converter
        test_json = '{
            "features": [
                {
                    "geometry": {
                        "coordinates": [
                            137.3798151,
                            34.7664678
                        ],
                        "type": "Point"
                    },
                    "properties": {
                        "time": "2019/04/01 12:34:33"
                    },
                    "type": "Feature"
                },
                {
                    "geometry": {
                        "coordinates": [
                            137.3797671,
                            34.7665228
                        ],
                        "type": "Point"
                    },
                    "properties": {
                        "time": "2019/04/01 12:34:34"
                    },
                    "type": "Feature"
                },
                {
                    "geometry": {
                        "coordinates": [
                            137.3797217,
                            34.7665995
                        ],
                        "type": "Point"
                    },
                    "properties": {
                        "time": "2019/04/01 12:34:35"
                    },
                    "type": "Feature"
                }
            ],
            "type": "FeatureCollection"
        }'

        geojson_hash = JSON.parse(test_json)
        time_array = Array.new

        geojson_hash["features"].each do |features|
            lon = features["geometry"]["coordinates"][0]
            lat = features["geometry"]["coordinates"][1]
            time = features["properties"]["time"]
        end

    end
end
