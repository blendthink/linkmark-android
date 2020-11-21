package dev.honwakalab.linkmark.apiclient.linkmark.api

import dev.honwakalab.linkmark.apiclient.infrastructure.CollectionFormats.*
import retrofit2.http.*
import retrofit2.Response
import okhttp3.RequestBody

import dev.honwakalab.linkmark.apiclient.linkmark.model.Tag

interface TagApi {
    /**
     * 全てのタグを取得する
     * Key, Token の組み合わせで取得可能な全てのタグを取得する
     * Responses:
     *  - 200: OK
     * 
     * @param key  
     * @param token  
     * @return [kotlin.collections.List<Tag>]
     */
    @GET("tags")
    suspend fun getTags(@Query("key") key: java.util.UUID, @Query("token") token: kotlin.String): Response<kotlin.collections.List<Tag>>

    /**
     * tタグを作成する
     * Key, Token の組み合わせで紐づけられたタグを作成する
     * Responses:
     *  - 200: OK
     * 
     * @param key  
     * @param token  
     * @param body  (optional)
     * @return [Unit]
     */
    @POST("tags")
    suspend fun postTags(@Query("key") key: java.util.UUID, @Query("token") token: kotlin.String, @Body body: kotlin.String? = null): Response<Unit>

}
