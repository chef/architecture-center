package main

import (
	"fmt"
	"net/http"
	"time"
	"html/template"	
)

var TEMPLATE *template.Template

func main() {
	tpl := template.New("Website")
	TEMPLATE, _ = tpl.Parse(WEBSITE)
	http.HandleFunc("/", pingHandler)
	http.ListenAndServe(":8003", nil)
}

func pingHandler(w http.ResponseWriter, r *http.Request) {
	currentTime := time.Now()
	body := template.HTML(fmt.Sprintf("Service Two (2): <pre>%s</pre>", currentTime.Format("2006-01-02 15:04:05 Monday")))
	TEMPLATE.Execute(w, Page{Title: "Time", Body: body})
}
