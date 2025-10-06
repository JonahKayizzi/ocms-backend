package com.caa.ocms.service;

import com.caa.ocms.model.CourseMaterial;
import com.caa.ocms.repository.CourseMaterialRepository;
import com.caa.ocms.repository.CourseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Service
@RequiredArgsConstructor
public class CourseMaterialService {
    private final CourseMaterialRepository materialRepository;
    private final CourseRepository courseRepository;

    public List<CourseMaterial> getMaterialsByCourse(Long courseId) {
        return materialRepository.findByCourseId(courseId);
    }

    public ResponseEntity<?> createMaterial(CourseMaterial material) {
        if (material.getCourse() == null || material.getCourse().getId() == null) {
            return ResponseEntity.badRequest().body("Course ID is required");
        }

        Optional<com.caa.ocms.model.Course> course = courseRepository.findById(material.getCourse().getId());
        if (course.isEmpty()) {
            return ResponseEntity.badRequest().body("Course not found");
        }

        material.setCourse(course.get());
        CourseMaterial saved = materialRepository.save(material);
        return ResponseEntity.ok(saved);
    }

    public ResponseEntity<?> editMaterial(Long materialId, CourseMaterial updates) {
        Optional<CourseMaterial> existing = materialRepository.findById(materialId);
        if (existing.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        CourseMaterial material = existing.get();
        if (updates.getName() != null) material.setName(updates.getName());
        if (updates.getDescription() != null) material.setDescription(updates.getDescription());
        if (updates.getFileUrl() != null) material.setFileUrl(updates.getFileUrl());
        if (updates.getFileType() != null) material.setFileType(updates.getFileType());
        if (updates.getFileSize() != null) material.setFileSize(updates.getFileSize());
        if (updates.getStatus() != null) material.setStatus(updates.getStatus());

        CourseMaterial saved = materialRepository.save(material);
        return ResponseEntity.ok(saved);
    }

    public ResponseEntity<String> deleteMaterial(Long materialId) {
        if (!materialRepository.existsById(materialId)) {
            return ResponseEntity.notFound().build();
        }
        materialRepository.deleteById(materialId);
        return ResponseEntity.ok("Material deleted successfully");
    }

    public ResponseEntity<?> createMaterialWithFile(Long courseId, MultipartFile file, String name, String description, String fileType) {
        if (courseId == null || file == null || file.isEmpty()) {
            return ResponseEntity.badRequest().body("Course ID and file are required");
        }

        Optional<com.caa.ocms.model.Course> courseOpt = courseRepository.findById(courseId);
        if (courseOpt.isEmpty()) {
            return ResponseEntity.badRequest().body("Course not found");
        }

        try {
            Path uploadRoot = Paths.get("uploads", "materials");
            Files.createDirectories(uploadRoot);
            String original = file.getOriginalFilename() != null ? file.getOriginalFilename().replaceAll("[^a-zA-Z0-9.\\-]", "_") : "file";
            String storedName = System.currentTimeMillis() + "_" + original;
            Path target = uploadRoot.resolve(storedName);
            Files.copy(file.getInputStream(), target, StandardCopyOption.REPLACE_EXISTING);

            CourseMaterial material = new CourseMaterial();
            material.setName(name != null ? name : original);
            material.setDescription(description);
            material.setFileUrl("/uploads/materials/" + storedName);
            material.setFileType(fileType != null ? fileType : file.getContentType());
            material.setFileSize(file.getSize());
            material.setCourse(courseOpt.get());

            CourseMaterial saved = materialRepository.save(material);
            return ResponseEntity.ok(saved);
        } catch (Exception ex) {
            return ResponseEntity.internalServerError().body("Failed to store file");
        }
    }

    public ResponseEntity<?> updateMaterialFile(Long materialId, MultipartFile file, String fileType) {
        if (file == null || file.isEmpty()) {
            return ResponseEntity.badRequest().body("File is required");
        }
        Optional<CourseMaterial> existing = materialRepository.findById(materialId);
        if (existing.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        try {
            Path uploadRoot = Paths.get("uploads", "materials");
            Files.createDirectories(uploadRoot);
            String original = file.getOriginalFilename() != null ? file.getOriginalFilename().replaceAll("[^a-zA-Z0-9.\\-]", "_") : "file";
            String storedName = System.currentTimeMillis() + "_" + original;
            Path target = uploadRoot.resolve(storedName);
            Files.copy(file.getInputStream(), target, StandardCopyOption.REPLACE_EXISTING);

            CourseMaterial material = existing.get();
            material.setFileUrl("/uploads/materials/" + storedName);
            material.setFileType(fileType != null ? fileType : file.getContentType());
            material.setFileSize(file.getSize());
            CourseMaterial saved = materialRepository.save(material);
            return ResponseEntity.ok(saved);
        } catch (Exception ex) {
            return ResponseEntity.internalServerError().body("Failed to store file");
        }
    }
}


