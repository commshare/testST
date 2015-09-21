cmake_minimum_required(VERSION 2.6)
project(stx)

add_definitions(-D_GNU_SOURCE)

add_executable(test-cares-st test-cares-st.c cares-st.c)
target_link_libraries(test-cares-st  st cares) #glib-2.0

add_executable(st-ssl ssl.c cares-st.c bio_netfd.c)
target_link_libraries(st-ssl  st cares ssl crypto) #glib-2.0
add_dependencies(st-ssl st cares)

