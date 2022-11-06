#include <stdio.h>
#include <GLES2/gl2.h>
#include <EGL/egl.h>
#include <GLFW/glfw3.h>

int main() {

  glfwInit();

  GLFWwindow *window = glfwCreateWindow(800, 600, "test", NULL, NULL);

  glfwMakeContextCurrent(window);

  glViewport(0, 0, 800, 600);

  while(!glfwWindowShouldClose(window)) {

	  glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
      glClear(GL_COLOR_BUFFER_BIT);
	glfwSwapBuffers(window);
    glfwPollEvents();
  }

  return 0;

}
