package com.nature.repository.process;

import com.nature.component.process.model.ProcessStopProperty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.io.Serializable;

public interface ProcessStopPropertyJpaRepository extends JpaRepository<ProcessStopProperty, String>, JpaSpecificationExecutor<ProcessStopProperty>, Serializable {

    @Modifying
    @Query("update ProcessStopProperty c set c.enableFlag = :enableFlag where c.id = :id")
    int updateEnableFlagById(@Param("id") String id, @Param("enableFlag") boolean enableFlag);

}
