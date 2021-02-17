package dev.honwakalab.linkmark.apiclient.linkmark.api

import dev.honwakalab.linkmark.apiclient.infrastructure.CollectionFormats.*
import dev.honwakalab.linkmark.apiclient.linkmark.model.Link
import retrofit2.Response
import retrofit2.http.*

interface LinkApi {
    /**
     * 全てのリンクを取得する
     * Key, Token の組み合わせで取得可能な全てのリンクを取得する
     * Responses:
     *  - 200: OK
     *
     * @param key
     * @param token
     * @return [kotlin.collections.List<Link>]
     */
    @GET("links")
    suspend fun getLinks(@Query("key") key: java.util.UUID, @Query("token") token: kotlin.String): Response<kotlin.collections.List<Link>>

    /**
     * リンクを作成する
     * Key, Token の組み合わせで紐づけられたリンクを作成する
     * Responses:
     *  - 200: OK
     *
     * @param key
     * @param token
     * @param body  (optional)
     * @return [Unit]
     */
    @POST("links")
    suspend fun postLinks(
        @Query("key") key: java.util.UUID,
        @Query("token") token: kotlin.String,
        @Body body: java.net.URI? = null
    ): Response<Unit>
}
