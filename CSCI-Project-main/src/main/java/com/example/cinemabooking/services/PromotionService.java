package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.Promotion;

public interface PromotionService {
    void save(Promotion promotion);
    Promotion findPromotionByPromotionID(Integer promotionID);
}
