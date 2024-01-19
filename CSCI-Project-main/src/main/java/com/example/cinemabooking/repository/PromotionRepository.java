package com.example.cinemabooking.repository;

import com.example.cinemabooking.entities.Promotion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PromotionRepository extends JpaRepository<Promotion, Integer> {
    Promotion findPromotionByPromotionID(Integer promotionID);
}
