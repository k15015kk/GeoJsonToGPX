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

# 注意事項

現状，緯度経度データ以外（例えば標高など）の要素をGPXファイル化することはできませんが，後々対応します．

私が勝手に定めたフォーマットでGPSデータをgeojson形式で採取しているため，`properties`内にある`time`要素は上記の例の通りのフォーマットでしか対応しておりません．(ミリセカンドは後日対応します)