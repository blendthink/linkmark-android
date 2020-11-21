package dev.honwakalab.linkmark.apiclient.linkmark.api

import dev.honwakalab.linkmark.apiclient.infrastructure.CollectionFormats.*
import retrofit2.Response
import retrofit2.http.*

interface TokenApi {
    /**
     * トークンを作成する
     * トークンを作成する
     * Responses:
     *  - 200: OK
     *
     * @param body  (optional)
     * @return [kotlin.String]
     */
    @POST("tokens")
    suspend fun postTokens(@Body body: java.util.UUID? = null): Response<kotlin.String>
}
