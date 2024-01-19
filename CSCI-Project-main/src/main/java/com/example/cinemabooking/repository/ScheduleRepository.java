package com.example.cinemabooking.repository;

import com.example.cinemabooking.entities.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ScheduleRepository extends JpaRepository<Schedule, Integer> {
    Schedule findScheduleByShowID(Integer showID);
}
