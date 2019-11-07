import requests

crime_params_description = {"inside_outside": ["Inside", "Outside", "inside", "outside"],
                            "crimedate": ["2018-10-19", "2018-10-19,2018-10-20","2018-p-10","2018-p-10,2018-10-19"],
                            "crimedate_range": ["2018-10-19,2018-10-20","2018-p-10,2018-10-19"],
                            "crimedate_lte": ["2018-10-19", "2018-19-p"],
                            "crimedate_gte": ["2018-10-19", "2018-19-p"],
                            "crimedate_year": ["2018", "2018,2019", "209p"],
                            "crimedate_month": ["10", "10,11", "1p", "10,p"],
                            "crimedate_day": ["1", "2,1", "p", "2,p"],
                            "weapon": ["NA", "NA,FIREARM"],
                            "location": ["300 S STRICKER ST", "300 S STRICKER ST,1600 S CHARLES ST"],
                            "latitude": ["39.2715017301", "p"],
                            "latitude_lte": ["39.2715017301", "p"],
                            "latitude_gte": ["39.2715017301", "p"],
                            "latitude_range": ["39.2,39.3", "p"],
                            "longitude": ["-76.6140833357", "p"],
                            "longitude_lte": ["-76.6140833357", "p"] ,
                            "longitude_gte": ["-76.6140833357", "p"],
                            "longitude_range": ["-76.7,-76.6"],
                            "post": ["934", "934,935"],
                            "district": ["WESTERN", "WESTERN,SOUTHERN"],
                            "neighborhood": ["S.B.I.C.", "NEW SOUTHWEST/MOUNT CLARE,S.B.I.C."],
                            "premise": ["STREET", "STREET,PARKING LOT-OUTSIDE"],
                            "crimecode": ["4A", "4A,4C"],
                            "description": ["HOMICIDE", "HOMICIDE,RAPE"],
                            "crimetime": ["00:00:00", "00:00:00,21:00:00", "p"],
                            "crimetime_range": ["00:00:00", "00:00:00,10:00:00", "p"],
                            "crimetime_lte": ["01:00:00", "p"],
                            "crimetime_gte": ["22:00:00", "p"],
                           }

def test_all():
    url = "http://localhost/crimeinstances/"
    for param_key in crime_params_description:
        for param_val in crime_params_description[param_key]:
            param = "?" + param_key + "=" + param_val
            print("Getting " + url + param)
            resp = requests.get(url + param)

            try:
                resp.raise_for_status()
            except:
                print("Failed: " + url + param)
                print()
                continue
            print("Found response with length: " + str(resp.json()["count"]))
            print()


if __name__ == "__main__":
    test_all()
