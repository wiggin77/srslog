package srslog

import (
	"io"
	"log"
)

var Logger log.Logger

func init() {
	Logger = log.Logger{}
	Logger.SetOutput(io.Discard)
}
