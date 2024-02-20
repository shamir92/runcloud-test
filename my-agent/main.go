package main

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	// Endpoint to set memory and storage limits
	r.POST("/set-limits", setLimitsHandler)
	r.GET("/health", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"message": "Healthy"})
	})

	// Run the server on port 8080
	r.Run(":8080")
}

func setLimitsHandler(c *gin.Context) {
	// Parse request data (assuming JSON payload)
	var request struct {
		MemoryLimit  string `json:"memory_limit"`
		StorageLimit string `json:"storage_limit"`
		User         string `json:"user"`
	}
	if err := c.ShouldBindJSON(&request); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request data"})
		return
	}

	// currently just return the limit cause it's just ask the memory and storage limit and return it
	log.Default().Println("Memory limit:", request.MemoryLimit)
	log.Default().Println("Storage limit:", request.StorageLimit)
	log.Default().Println("User:", request.User)

	c.JSON(http.StatusOK, gin.H{"message": "Memory Limit: " + string(request.MemoryLimit) + " Storage Limit: " + string(request.StorageLimit) + " User: " + request.User + " is set successfully!"})
}
