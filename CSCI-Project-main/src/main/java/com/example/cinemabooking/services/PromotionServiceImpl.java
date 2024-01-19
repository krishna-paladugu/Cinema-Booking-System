package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.Promotion;
import com.example.cinemabooking.repository.PromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PromotionServiceImpl implements PromotionService {
    @Autowired
    private PromotionRepository promotionRepository;

    @Override
    public void save(Promotion promotion) {
        promotionRepository.save(promotion);
    }

    @Override
    public Promotion findPromotionByPromotionID(Integer promotionID) {
        return promotionRepository.findPromotionByPromotionID(promotionID);
    }
}
