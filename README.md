# README

時系列要素をプロパティ要素で追加したgeojsonをGPXファイルに変換するアプリケーションです．

# InputGeoJson

入力するgeojson形式のテキスト例です．

``` json
{
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
}
```

# OutputGPX
``` xml
<?xml version='1.0' encoding='UTF-8'?>
<gpx version='1.1' creator='kyotonagoya' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://www.topografix.com/GPX/1/1' xsi:schemaLocation='http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd'>
  <metadata>
    <time>
      2019-04-01T12:34:33.000Z
    </time>
  </metadata>
  <trk>
    <trkseg>
      <trkpt lat='34.7664678' lon='137.3798151'>
        <time>
          2019-04-01T12:34:33.000Z
        </time>
        <src>
          gps
        </src>
      </trkpt>
      <trkpt lat='34.7665228' lon='137.3797671'>
        <time>
          2019-04-01T12:34:34.000Z
        </time>
        <src>
          gps
        </src>
      </trkpt>
      <trkpt lat='34.7665995' lon='137.3797217'>
        <time>
          2019-04-01T12:34:35.000Z
        </time>
        <src>
          gps
        </src>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```

# 注意事項

現状，緯度経度データ以外（例えば標高など）の要素をGPXファイル化することはできませんが，後々対応します．

私が勝手に定めたgeojson形式のフォーマットでGPSデータを採取しているため，`properties`内にある`time`要素は上記の例の通りのフォーマットでしか対応しておりません．(ミリセカンドは後日対応します)

ローカルで動作させるためのアプリケーションとして開発したため，herokuや自分のサーバ等に公開はしておりません．