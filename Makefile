TARGET = App

BIN_DIR = bin

CPPFILES = $(shell find src -type f -iname *.cpp)
OBJECTS = $(CPPFILES:%.cpp=%.o)

INCLUDES = -Iinclude
LIBS = -lm -ldl -L./libs
CPPFLAGS = -Wall -Werror -Wextra $(INCLUDES) -O1
MV = mv

ifeq ($(BUILD), debug)
	CPPFLAGS += -O0 -g
else ifeq ($(BUILD), realase)
	CPPFLAGS += -O3 -s -DNDEBUG
endif

%.o: %.cpp
	$(CXX) $(CPPFLAGS) -c -o $@ $<
	$(MV) $@ $(BIN_DIR)

$(TARGET): $(OBJECTS)
	$(CXX) -o $@ $(wildcard $(BIN_DIR)/*.o) $(LIBS)

all: $(CPPFILES) $(OBJECTS)

.PHONY: $(BIN_DIR)

clean:
	$(RM)  $(TARGET) $(BIN_DIR)/*.o $(OBJECTS)
setup:
	mkdir -p bin include libs assets