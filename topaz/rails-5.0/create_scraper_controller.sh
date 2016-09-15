#!/bin/bash

rails g controller scraper `:scraper controller` \
    home \
    statistics \
    scrape scrape_results \
    avenue `: 'route for viewing avenue data'` \
    access access_response `: 'routes for viewing acess data and access responses'` \
    `: 'routes for viewing collections (items), data on instances (item) and actual server responses for instances (item_data)'` \
        documents document document_data \
        contents content content_data \
        pages page_map page page_data `: 'page_map shows links between pages'` \
        images image_map image image_data