# Compilateur et flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -g
LDFLAGS =

# Répertoires
SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin

# Fichiers
SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
TARGET = $(BIN_DIR)/program

# Règle par défaut
all: $(TARGET)

# Création du binaire
$(TARGET): $(OBJECTS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)
	@echo "Build terminé: $(TARGET)"

# Compilation des fichiers objets
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Exécution
run: $(TARGET)
	./$(TARGET)

# Nettoyage
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

# Debug avec GDB
debug: $(TARGET)
	gdb $(TARGET)

# Vérification mémoire avec Valgrind
valgrind: $(TARGET)
	valgrind --leak-check=full --show-leak-kinds=all ./$(TARGET)

.PHONY: all run clean debug valgrind
