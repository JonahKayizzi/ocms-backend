package com.caa.ocms.controller;

import com.caa.ocms.model.CourseMaterial;
import com.caa.ocms.service.CourseMaterialService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/course-materials")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class CourseMaterialController {
    private final CourseMaterialService materialService;

    @GetMapping("/course/{courseId}")
    public ResponseEntity<List<CourseMaterial>> getMaterialsByCourse(@PathVariable Long courseId) {
        List<CourseMaterial> materials = materialService.getMaterialsByCourse(courseId);
        return ResponseEntity.ok(materials);
    }

    @PostMapping
    public ResponseEntity<?> createMaterial(@RequestBody CourseMaterial material) {
        return materialService.createMaterial(material);
    }

    @PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> uploadMaterial(
            @RequestParam("courseId") Long courseId,
            @RequestParam("file") MultipartFile file,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "description", required = false) String description,
            @RequestParam(value = "fileType", required = false) String fileType
    ) {
        return materialService.createMaterialWithFile(courseId, file, name, description, fileType);
    }

    @PutMapping("/{materialId}")
    public ResponseEntity<?> editMaterial(@PathVariable Long materialId, @RequestBody CourseMaterial updates) {
        return materialService.editMaterial(materialId, updates);
    }

    @PutMapping(value = "/{materialId}/file", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> updateMaterialFile(
            @PathVariable Long materialId,
            @RequestParam("file") MultipartFile file,
            @RequestParam(value = "fileType", required = false) String fileType
    ) {
        return materialService.updateMaterialFile(materialId, file, fileType);
    }

    @DeleteMapping("/{materialId}")
    public ResponseEntity<String> deleteMaterial(@PathVariable Long materialId) {
        return materialService.deleteMaterial(materialId);
    }
}


