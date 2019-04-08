require 'rexml/document'

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

        # XMLドキュメント作成とXMLの一番最初の行（XMLの設定）の宣言
        doc = REXML::Document.new
        doc << REXML::XMLDecl.new('1.0', 'UTF-8')

        # gpxタグ設定
        gpx = REXML::Element.new('gpx')
        gpx.add_attribute('version','1.1')
        gpx.add_attribute('creator','kyotonagoya')
        gpx.add_attribute('xmlns:xsi','http://www.w3.org/2001/XMLSchema-instance')
        gpx.add_attribute('xmlns','http://www.topografix.com/GPX/1/1')
        gpx.add_attribute('xsi:schemaLocation','http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd')

        # metadataタグの設定
        first_geojson_data = geojson_hash["features"][0]
        first_time = first_geojson_data["properties"]["time"]

        first_time_gpx_format = time_format_converter(first_time)

        metadata = REXML::Element.new('metadata')
        metadata_time = REXML::Element.new('time')
        metadata_time.add_text(first_time_gpx_format)
        metadata.add_element(metadata_time)

        # trkタグ（トラッキングタグ）の設定
        trk = REXML::Element.new('trk')
        trkseg = REXML::Element.new('trkseg')

        geojson_hash["features"].each do |features|
            trkpt = REXML::Element.new('trkpt')

            lon = features["geometry"]["coordinates"][0]
            lat = features["geometry"]["coordinates"][1]
            trkpt.add_attribute('lat',lat.to_s)
            trkpt.add_attribute('lon',lon.to_s) 

            time_element = REXML::Element.new('time')
            time_data = features["properties"]["time"]
            time_gpx_format = time_format_converter(time_data)
            time_element.add_text(time_gpx_format)

            src = REXML::Element.new('src')
            src.add_text('gps')

            trkpt.add_element(time_element)
            trkpt.add_element(src)
            trkseg.add_element(trkpt)
        end

        trk.add_element(trkseg)

        # gpxタグにmetadataとtrkタグを追加して出力
        gpx.add_element(metadata)
        gpx.add_element(trk)

        doc.add_element(gpx)
        File.open('output.gpx', 'w') do |file|
            doc.write(file, indent=2)
        end

        render plain: doc
    end

    def time_format_converter(time)
        time_split_data = time.split
        time_date = time_split_data[0].gsub('/','-')
        time_timepoint = time_split_data[1] + ".000"

        return time_date + 'T' + time_timepoint + 'Z'
    end
end
