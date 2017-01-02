package main

import (
	"flag"
	"fmt"
	"os"
	"path"

	"github.com/mdp/qrterminal"
	"github.com/mdp/rsc/qr"
)

var flagV = flag.Bool("version", false, "Print version and exit")

var Program, Version string

func main() {
	Program = path.Base(os.Args[0])
	if Version == "" {
		Version = "Unknown Version"
	}

	flag.Usage = func() {
		fmt.Fprintf(os.Stderr, "%s (%s)\n", Program, Version)
		fmt.Fprintf(os.Stderr, "Usage: %s TEXT\n", Program)
		flag.PrintDefaults()
		os.Exit(1)
	}

	flag.Parse()

	if *flagV {
		fmt.Println(Program, Version)
		return
	}

	args := flag.Args()
	if len(args) != 1 {
		flag.Usage()
	}

	qrterminal.Generate(args[0], qr.H, os.Stdout)
}
