package main

import (
	"fmt"
	"log"
	"net/http"
	"strings"
)

func votingBooth(w http.ResponseWriter, r *http.Request) {
  log.Println(r.RemoteAddr, r.Method, r.URL)
	// Parse form arguments, must call this manually
	r.ParseForm()

	// Log form information in server side
	for k, v := range r.Form {
		fmt.Println("key: ", k)
		fmt.Println("val: ", strings.Join(v, ""))
	}

	// Send data to client side
	fmt.Fprintf(w, "Hello voter!")
}

func main() {
	// Set router
	http.HandleFunc("/", votingBooth)
	// Set listen port
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
