package com.caa.ocms.controller;

import com.caa.ocms.model.Module;
import com.caa.ocms.service.ModuleService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ModuleController {
    private final ModuleService moduleService;

    public ModuleController(ModuleService moduleService) {
        this.moduleService = moduleService;
    }

    @GetMapping("/modules/course/{courseId}")
    public List<Module> listByCourse(@PathVariable Long courseId) {
        return moduleService.getModulesByCourse(courseId);
    }

    @PostMapping("/add-module/{courseId}")
    public ResponseEntity<Module> addModule(@PathVariable Long courseId, @RequestBody Module module) {
        return ResponseEntity.status(201).body(moduleService.createModule(courseId, module));
    }

    // Canonical endpoint used by the OCMS frontend
    @PostMapping("/modules")
    public ResponseEntity<Module> createModule(@RequestBody Module module) {
        Long courseId = module.getCourse() != null ? module.getCourse().getId() : null;
        if (courseId == null) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.status(201).body(moduleService.createModule(courseId, module));
    }

    @PutMapping("/modules/{id}")
    public ResponseEntity<Module> updateModule(@PathVariable Long id, @RequestBody Module updates) {
        return ResponseEntity.ok(moduleService.updateModule(id, updates));
    }
}




