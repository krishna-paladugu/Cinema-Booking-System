package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.Schedule;

public interface ScheduleService {
    void save(Schedule schedule);
    Schedule findScheduleByShowID(Integer showID);
}
