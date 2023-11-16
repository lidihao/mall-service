/**
 * @author lidihao
 * @Description:
 */

package com.hao.mall.promotiton.service.service.impl;


import com.hao.mall.promotiton.service.constant.RedisConstant;
import com.hao.mall.promotiton.service.dto.*;
import com.hao.mall.promotiton.service.service.api.PromotionService;
import com.hao.mall.promotiton.service.service.remote.MemberRemoteService;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;


@DubboService
@Service
public class PromotionServiceImpl implements PromotionService {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private MemberRemoteService memberRemoteService;


    @Override
    public PromotionCalculateRespDto calculatePromotion(PromotionCalculateReqDto promotionCalculateReqDto){
        //找出所有命中的规则
        MemberDto memberDto = memberRemoteService.getMemberDtoById(promotionCalculateReqDto.getMemberId());



        return null;
    }



    public FindHitPromotionRuleRespDto findAllHitPromotionRule(FindHitPromotionRuleReqDto findHitPromotionRuleReqDto){
        // 根据用户群维度搜索
        Set<Long> userDimensionRule =  findPromotionRuleByUserDimension(findHitPromotionRuleReqDto.getMemberDto());

        // 根据门店维度搜索

        // 根据标签维度搜索

        // 根据商品维度搜索

        // 根据下单渠道搜索


        return null;
    }

    private Set<Long> findPromotionRuleByUserDimension(MemberDto memberDto){
        Set<String> useDimensionKeySet = new HashSet<>();
        // 在有效期内的规则，定时刷新一次
        useDimensionKeySet.add(RedisConstant.PROMOTION_RULE_TIME_RANGE_DIMENSION);
        useDimensionKeySet.add(String.format(RedisConstant.PROMOTION_RULE_USER_LEVEL_DIMENSION , memberDto.getMemberId()));
        return new HashSet<>();
    }



}
