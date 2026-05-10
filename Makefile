EXE = main
IMGUI_DIR = externals/include/imgui
OBJ_DIR = objects

SOURCES = src/main.cpp src/menu_files.cpp src/nbgc.cpp src/visual.cpp src/filtre.cpp
SOURCES += $(IMGUI_DIR)/imgui.cpp $(IMGUI_DIR)/imgui_demo.cpp $(IMGUI_DIR)/imgui_draw.cpp $(IMGUI_DIR)/imgui_tables.cpp $(IMGUI_DIR)/imgui_widgets.cpp
SOURCES += $(IMGUI_DIR)/backends/imgui_impl_glfw.cpp $(IMGUI_DIR)/backends/imgui_impl_opengl3.cpp
OBJS = $(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(basename $(notdir $(SOURCES)))))
DEPS = $(OBJS:.o=.d)

UNAME_S := $(shell uname -s)
LINUX_GL_LIBS = -lGL

CXXFLAGS = -std=c++17 -I$(IMGUI_DIR) -I$(IMGUI_DIR)/backends
CXXFLAGS += -g -Wall -Wformat -Wno-narrowing -Lexternals/libs -MMD -MP
LIBS =

##---------------------------------------------------------------------
## OPENGL ES
##---------------------------------------------------------------------

## This assumes a GL ES library available in the system, e.g. libGLESv2.so
# CXXFLAGS += -DIMGUI_IMPL_OPENGL_ES2
# LINUX_GL_LIBS = -lGLESv2

##---------------------------------------------------------------------
## BUILD FLAGS PER PLATFORM
##---------------------------------------------------------------------

ifeq ($(UNAME_S), Linux) #LINUX
	ECHO_MESSAGE = "Linux"
	LIBS += $(LINUX_GL_LIBS) `pkg-config --static --libs glfw3`
	CXXFLAGS += `pkg-config --cflags glfw3`
endif

ifeq ($(UNAME_S), Darwin) #APPLE
	ECHO_MESSAGE = "Mac OS X"
	LIBS += -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo
	LIBS += -L/usr/local/lib -L/opt/local/lib -L/opt/homebrew/lib
	LIBS += -lglfw
	CXXFLAGS += -I/usr/local/include -I/opt/local/include -I/opt/homebrew/include
endif

ifeq ($(OS), Windows_NT)
	ECHO_MESSAGE = "MinGW"
	LIBS += -lglfw3 -lgdi32 -lopengl32 -limm32
	CXXFLAGS += -Lexternals/libs/windows-mingw64-13.2.0
	CFLAGS = $(CXXFLAGS)
endif

##---------------------------------------------------------------------
## DIRECTORY CREATION
##---------------------------------------------------------------------

ifeq ($(OS), Windows_NT)
	MKDIR_P = if not exist $(OBJ_DIR) mkdir $(OBJ_DIR)
	RM = del /Q
else
	MKDIR_P = mkdir -p $(OBJ_DIR)
	RM = rm -f
endif


all: $(EXE)
	@echo Build complete for $(ECHO_MESSAGE)

##---------------------------------------------------------------------
## LINKING
##---------------------------------------------------------------------

$(EXE): $(OBJ_DIR) $(OBJS)
	$(CXX) -o $@ $(OBJS) $(CXXFLAGS) $(LIBS)

##---------------------------------------------------------------------
## OBJECT DIRECTORY
##---------------------------------------------------------------------

$(OBJ_DIR):
	$(MKDIR_P)

##---------------------------------------------------------------------
## COMPILATION RULES
##---------------------------------------------------------------------

$(OBJ_DIR)/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -Iexternals/include -c $< -o $@

$(OBJ_DIR)/%.o: $(IMGUI_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -Iexternals/include -c $< -o $@

$(OBJ_DIR)/%.o: $(IMGUI_DIR)/backends/%.cpp
	$(CXX) $(CXXFLAGS) -Iexternals/include -c $< -o $@

##---------------------------------------------------------------------
## UTILITIES
##---------------------------------------------------------------------

clean:
	$(RM) $(EXE) $(OBJS) $(DEPS)

run: $(EXE)
	./$(EXE)

-include $(DEPS)