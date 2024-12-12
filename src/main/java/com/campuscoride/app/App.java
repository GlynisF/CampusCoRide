package com.campuscoride.app;


import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;

/**
 * The type App.
 */
@ApplicationPath("/services")
public class App extends Application {

    public App() {

    }

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> classes = new HashSet<Class<?>>();
        classes.add(RideFormService.class);
        classes.add(StudentService.class);
        classes.add(CorsFilter.class);
        return classes;
    }
}
