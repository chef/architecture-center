package main

import "html/template"

type Page struct {
	Title string
	Body  template.HTML
}

const WEBSITE string = `<!DOCTYPE html>
<html lang="en">
  <body>
	<h1>{{.Title}}</h1>
	<div>
		{{.Body}}
    </div>
</html>`
