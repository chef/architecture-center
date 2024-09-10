package main

import (
	"fmt"
	"net/http"
	"os"
	"html/template"	
	"encoding/json"	
	"io/ioutil"
)

type Config struct {
	Message string `json:"message"`
}

var TEMPLATE *template.Template
var CFG Config

func main() {
	jsonFile, err := os.Open(os.Args[1])
	if err != nil {
		fmt.Println(err)
	}
	defer jsonFile.Close()
	byteValue, _ := ioutil.ReadAll(jsonFile)
	json.Unmarshal(byteValue, &CFG)

	tpl := template.New("Website")
	TEMPLATE, _ = tpl.Parse(WEBSITE)
	http.HandleFunc("/", pingHandler)
	http.ListenAndServe(":8001", nil)
}

func pingHandler(w http.ResponseWriter, r *http.Request) {
	body := template.HTML( CFG.Message )
	TEMPLATE.Execute(w, Page{Title: "Config", Body: body})
}
